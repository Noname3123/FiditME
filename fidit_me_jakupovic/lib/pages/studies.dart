import 'package:fidit_me_jakupovic/builder_classes/document_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;

///This class represents the page containing documents related to Study programmes
class StudiesPage extends StatelessWidget {
  ///Constructor must receive the getRole method in order to adapt the page to the current role
  const StudiesPage({super.key, required this.getRole});

  final Function getRole;

  @override
  Widget build(BuildContext context) {
    Map<Map<String, List<documents.Document>>, bool>
        documentsRolePermissionMap = {
      //this maps a list of docs to the appropriate role permission
      documents.dokumentPrijediplomskiProgram:
          getRole().hidePlanOfUndergraduateStudies,
      documents.dokumentDiplomskiProgram: getRole().hidePlanOfGraduateStudies,
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
              AppLocalizations.of(context)!.studiji,
              AppLocalizations.of(context)!.dokumentiNaslov)
        ]));
  }
}
