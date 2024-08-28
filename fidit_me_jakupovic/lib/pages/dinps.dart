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
  final contentTextStyle = const TextStyle(fontSize: 32);
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

  ///this method iterates through all DINP docs and renders a card for all of them. It returns a list of widgets
  Widget generateButtonsForDocuments(BuildContext context,
      Map<int, List<documents.Document>> listOfDocuments) {
    //TODO: this method must receive a class containing dinp semester, subject name and appropriate share + open document methods
    return Column(
      children: [
        ...listOfDocuments.keys.map((key) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$key semestar",
                style: contentTextStyle,
              ),
              const Divider(),
              ...listOfDocuments[key]!.map((document) {
                return createDocumentButton(context, document);
              }),
              const Divider(),
            ],
          );
        })
      ], //TODO: localize
    );
  }

  ///this method creates and returns a Card widget which is populated with documents
  Widget createCard(BuildContext context,
      Map<int, List<documents.Document>> listOfDocuments) {
    //TODO: add appropriate params to load names accurately
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
            child: generateButtonsForDocuments(context, listOfDocuments)),
      ],
    ));
  }

  ///This method returns a widget which represents a document button which contains share and download methods
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
                    document.documentName,
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
    //TODO: add param to determine doc URL

    Share.share(document.url.toString(),
        subject:
            "Sharing {filename}"); //TODO: Localize this message and instead of filename add the name of file
  }

  ///This async method opens the appropriate document.
  ///
  void openDocument(documents.Document document) async {
    //TODO: add param which will open doc

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

    /*var pdfDocument =*/ //openfilex open file here;
    OpenFilex.open(pdfFile.path);
  }
}
