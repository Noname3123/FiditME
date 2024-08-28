import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: [createDocumentCard(context)]));
  }

  ///this method iterates through all DINP docs and renders a card for all of them. It returns a list of widgets
  // Widget[] renderCardsForDINPS(){
  //TODO: this method must receive a class containing dinp semester, subject name and appropriate share + open document methods
  //}

  ///this method creates and returns a Card widget
  Widget createDocumentCard(BuildContext context) {
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
          child: Column(
            children: [createDocumentButton(context)],
          ),
        ),
      ],
    ));
  }

  ///This method returns a widget which represents a document button which contains share and download methods
  Widget createDocumentButton(BuildContext context) {
    return Container(
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
                onPressed: () {},
                icon: Icon(
                  Icons.description,
                  size: iconSize,
                ),
                label: Text(
                  "Filename",
                  style: contentTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(
            height: documentButtonStyleheight,
            child: FilledButton.tonalIcon(
              onPressed: () {},
              label: Icon(
                Icons.share,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
