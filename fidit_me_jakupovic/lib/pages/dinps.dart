import 'package:flutter/material.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;
import 'package:fidit_me_jakupovic/builder_classes/document_card_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DinpsPage extends StatelessWidget {
  ///Constructor receives getRole method from parent widget. Method is used to change loaded content depending on permissions.
  const DinpsPage({super.key, required this.getRole});

  final Function getRole;

  @override
  Widget build(BuildContext context) {
    Map<Map<String, List<documents.Document>>, bool>
        documentsRolePermissionMap = {
      documents.dinpPreddiplomskiStudiji: getRole().hideUnderGraduateStudyDINPS,
      documents.dinpDiplomskiStudiji: getRole().hideGraduateStudyDINPS
    };

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
              documentsRolePermissionMap,
              AppLocalizations.of(context)!.dinpPlanovi,
              AppLocalizations.of(context)!.semestar,
              cardContentDescription:
                  AppLocalizations.of(context)!.izvedbeniPlanOpis),
        ]));
  }
}
