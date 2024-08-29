import 'package:fidit_me_jakupovic/builder_classes/document_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:fidit_me_jakupovic/models/internet_documents.dart' as documents;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnrollPage extends StatelessWidget {
  ///This constructor requires the getRole method which is used to define which parts of page to make available
  const EnrollPage({super.key, required this.getRole});

  final Function getRole;
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
          getRole().hideUndergraduateStudiesEnrollment == false
              ? DocumentCardBuilder.createCard(
                  context,
                  documents.dokumentiUpisPredDiplomskiStudij,
                  AppLocalizations.of(context)!.upisi,
                  AppLocalizations.of(context)!.dokumentiNaslov)
              : Container(),
          getRole().hideGraduateStudiesEnrollment == false
              ? DocumentCardBuilder.createCard(
                  context,
                  documents.dokumentiUpisDiplomskiStudij,
                  "AppLocalizations.of(context)!.upisi",
                  AppLocalizations.of(context)!.dokumentiNaslov)
              : Container(),
          getRole().hideSeniorYearsEnrollmentDocs == false
              ? DocumentCardBuilder.createCard(
                  context,
                  documents.dokumentiUpisViseGodine,
                  AppLocalizations.of(context)!.upisi,
                  AppLocalizations.of(context)!.dokumentiNaslov)
              : Container(), //TODO:change which docs are sent here depending on role
        ]));
  }
}
