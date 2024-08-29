import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

///this class exposes static methods which creates cards filled with document download/share buttons
class DocumentCardBuilder {
  static const titleTextStyle =
      TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  static const contentTextStyle = TextStyle(
    fontSize: 16,
  );
  static const subTitleTextStyle = TextStyle(
    fontSize: 32,
  );
  static const iconSize = 36.0;

  static const documentButtonStyleheight = 64.0;

  ///this method iterates through all DINP docs and renders a card for all of them. It returns a list of widgets. Required parameters are the build context of the widgets and a list of document objects
  static Widget _generateButtonsForDocuments(BuildContext context,
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
                return _createDocumentButton(context, document);
              }),
              const Divider(),
            ],
          );
        })
      ],
    );
  }

  ///this method creates and returns a Card widget which is populated with documents
  static Widget createCard(BuildContext context,
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
            child: _generateButtonsForDocuments(context, listOfDocuments)),
      ],
    ));
  }

  ///This method returns a widget which represents a document button which contains share and download methods. It receives build context and document object as parameters. Build context is essential for establishing localization.
  static Widget _createDocumentButton(
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
                    _openDocument(document);
                  },
                  icon: const Icon(
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
                  _shareDocument(context, document);
                },
                label: const Icon(
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
  static void _shareDocument(
      BuildContext context, documents.Document document) async {
    Share.share(document.url.toString(),
        subject: AppLocalizations.of(context)!.porukaDijeljenjaDokumenta(
            AppLocalizations.of(context)!.dokumenti(document.documentName)));
  }

  ///This async method opens the appropriate document.
  ///
  static void _openDocument(documents.Document document) async {
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
