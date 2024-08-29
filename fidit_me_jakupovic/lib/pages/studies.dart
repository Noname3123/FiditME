import 'package:fidit_me_jakupovic/builder_classes/document_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;

class StudiesPage extends StatelessWidget {
  const StudiesPage({super.key});

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
          DocumentCardBuilder.createCard(
              context,
              documents.dokumentDiplomskiProgram,
              AppLocalizations.of(context)!.studiji,
              AppLocalizations.of(context)!
                  .dokumentiNaslov) //TODO:change which docs are sent here depending on role
        ]));
  }
}
