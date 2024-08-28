import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;

class DinpsPage extends StatelessWidget {
  const DinpsPage({super.key});
  final titleTextStyle =
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  final contentTextStyle = const TextStyle(
    fontSize: 16,
  );
  final subTitleTextStyle = const TextStyle(
    fontSize: 32,
  );
  final iconSize = 36.0;

  final documentButtonStyleheight = 64.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement page
    return Theme(
        data: Theme.of(context).copyWith(
            listTileTheme: const ListTileThemeData(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
            dividerTheme: const DividerThemeData(
                thickness: 2, indent: 15, endIndent: 15)),
        child: ListView(padding: const EdgeInsets.all(8), children: [
          createCard(
              context,
              documents
                  .dinpPreddiplomskiStudiji) //TODO:change which docs are sent here depending on role
        ]));
  }

//TODO: generateButtonsForDocuments, createCard, createDocumentButton, shareDocument, openDocument => move these methods and appropriate variables in a static class/ another package since it will be used for other sites
  ///this method iterates through all DINP docs and renders a card for all of them. It returns a list of widgets. Required parameters are the build context of the widgets and a list of document objects
  Widget generateButtonsForDocuments(BuildContext context,
      Map<int, List<documents.Document>> listOfDocuments) {
    return Column(
      children: [
        ...listOfDocuments.keys.map((key) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.semestar(key),
                style: subTitleTextStyle,
              ),
              const Divider(),
              ...listOfDocuments[key]!.map((document) {
                return createDocumentButton(context, document);
              }),
              const Divider(),
            ],
          );
        })
      ],
    );
  }

  ///this method creates and returns a Card widget which is populated with documents
  Widget createCard(BuildContext context,
      Map<int, List<documents.Document>> listOfDocuments) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations.of(context)!.dinpPlanovi,
            style: titleTextStyle,
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            AppLocalizations.of(context)!.izvedbeniPlanOpis,
            style: contentTextStyle,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: generateButtonsForDocuments(context, listOfDocuments)),
      ],
    ));
  }

  ///This method returns a widget which represents a document button which contains share and download methods. It receives build context and document object as parameters. Build context is essential for establishing localization.
  Widget createDocumentButton(
      BuildContext context, documents.Document document) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(180), right: Radius.circular(180))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: documentButtonStyleheight,
                child: TextButton.icon(
                  onPressed: () {
                    openDocument(document);
                  },
                  icon: Icon(
                    Icons.description,
                    size: iconSize,
                  ),
                  label: AutoSizeText(
                    AppLocalizations.of(context)!
                        .dokumenti(document.documentName),
                    style: contentTextStyle,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: documentButtonStyleheight,
              child: FilledButton.tonalIcon(
                onPressed: () {
                  shareDocument(context, document);
                },
                label: Icon(
                  Icons.share,
                  size: iconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///this async method shares the document to appropriate app on the playtform
  void shareDocument(BuildContext context, documents.Document document) async {
    Share.share(document.url.toString(),
        subject: AppLocalizations.of(context)!.porukaDijeljenjaDokumenta(
            AppLocalizations.of(context)!.dokumenti(document.documentName)));
  }

  ///This async method opens the appropriate document.
  ///
  void openDocument(documents.Document document) async {
    var pdfResponse = await http.get(document.url);

    if (pdfResponse.statusCode != 200) {
      throw Exception('Failed to download PDF');
    }

    Directory tempDir = await getTemporaryDirectory();
    var dirExists = await tempDir.exists();

    if (!dirExists) {
      await tempDir.create();
    }

    String tempPath = tempDir.path;

    var pdfFile = File('$tempPath/pdf-doc.pdf');
    await pdfFile.writeAsBytes(pdfResponse.bodyBytes);

    OpenFilex.open(pdfFile.path);
  }
}
