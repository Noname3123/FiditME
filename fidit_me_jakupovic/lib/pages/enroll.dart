import 'package:fidit_me_jakupovic/builder_classes/document_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///This class represents the enroll page which contains documents related to enrolling to studies
class EnrollPage extends StatelessWidget {
  ///This constructor requires the getRole method which is used to define which parts of page to make available
  const EnrollPage({super.key, required this.getRole});

  final Function getRole;
  @override
  Widget build(BuildContext context) {
    Map<Map<String, List<documents.Document>>, bool>
        documentsRolePermissionMap = {
      //this maps a list of docs to the appropriate role permission
      documents.dokumentiUpisPredDiplomskiStudij:
          getRole().hideUndergraduateStudiesEnrollment,
      documents.dokumentiUpisDiplomskiStudij:
          getRole().hideGraduateStudiesEnrollment,
      documents.dokumentiUpisViseGodine:
          getRole().hideSeniorYearsEnrollmentDocs,
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
              AppLocalizations.of(context)!.upisi,
              AppLocalizations.of(context)!.dokumentiNaslov)
        ]));
  }
}
