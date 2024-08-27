import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final titleTextStyle =
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  final contentTextStyle = const TextStyle(fontSize: 16);

  final phoneNumber = "+ 385 51 584 700";
  final eMail = "ured@inf.uniri.hr";

  @override
  Widget build(BuildContext context) {
    // TODO: implement page
    return Theme(
      data: Theme.of(context).copyWith(
          listTileTheme: const ListTileThemeData(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
          dividerTheme:
              const DividerThemeData(thickness: 2, indent: 15, endIndent: 15)),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.osnovneInfo,
                  style: titleTextStyle,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(phoneNumber),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(eMail),
                    ),
                    ListTile(
                      leading: const Icon(Icons.place),
                      title: Text(AppLocalizations.of(context)!.adresa),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [Text("Google maps here")],
                ),
              ),
            ],
          )),
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.misija,
                  style: titleTextStyle,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(AppLocalizations.of(context)!.misijaContent,
                    style: contentTextStyle),
              ),
            ],
          )),
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.vizija,
                  style: titleTextStyle,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(AppLocalizations.of(context)!.vizijaContent,
                    style: contentTextStyle),
              ),
            ],
          )),
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppLocalizations.of(context)!.vrijednosti,
                  style: titleTextStyle,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(AppLocalizations.of(context)!.vrijednostiContent,
                    style: contentTextStyle),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
