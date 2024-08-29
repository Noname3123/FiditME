import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<StatefulWidget> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  final titleTextStyle =
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
  final contentTextStyle = const TextStyle(fontSize: 16);

  final phoneNumber = "+ 385 51 584 700";
  final eMail = "ured@inf.uniri.hr";

  final LatLng locationFidit = const LatLng(45.3286374, 14.4664673);

  ///this private async method opens the call screen when user presses phone number
  void _openCallScreen() async {
    final phoneUri = Uri(scheme: "tel", path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  ///this private async method opens the email screen when user presses email
  void _openEmail() async {
    final eMailUri = Uri(scheme: "mailto", path: eMail);
    if (await canLaunchUrl(eMailUri)) {
      await launchUrl(eMailUri);
    }
  }

  ///this private async method opens the website connected to open streetmap copyright
  void _openStreetMapCredits() async {
    final internetURi =
        Uri(scheme: "https", path: "openstreetmap.org/copyright");
    if (await canLaunchUrl(internetURi)) {
      await launchUrl(internetURi);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      onTap: () {
                        _openCallScreen();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: Text(eMail),
                      onTap: () {
                        _openEmail();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.place),
                      title: Text(AppLocalizations.of(context)!.adresa),
                    )
                  ],
                ),
              ),
              const Divider(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox.fromSize(
                    size: Size.fromHeight(
                        (MediaQuery.of(context).size.width) / 2),
                    child: createMap(locationFidit),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                  child: FilledButton.tonal(
                      onPressed: () {
                        MapsLauncher.launchCoordinates(
                            locationFidit.latitude, locationFidit.longitude);
                      },
                      child:
                          Text(AppLocalizations.of(context)!.navigacijskiGumb)),
                ),
              )
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

  ///This method creates the map which is shown on the screen and pinpoints and centers the map on the location of object. Parameter location is a latLng object which represents coords of object on map. Method returns Widget
  Widget createMap(LatLng location) {
    return FlutterMap(
        options: MapOptions(
            initialCenter: location,
            initialZoom: 17,
            interactionOptions:
                const InteractionOptions(flags: InteractiveFlag.pinchZoom)),
        children: [
          openStreetMapTile,
          MarkerLayer(markers: [
            Marker(
                point: location,
                width: 32,
                height: 32,
                child: const Icon(
                  Icons.place,
                  color: Colors.red,
                  size: 32,
                ))
          ]),
          TextButton(
            child: const Text("Map data from OpenStreetMap"),
            onPressed: () {
              _openStreetMapCredits();
            },
          ),
        ]);
  }

  TileLayer get openStreetMapTile => TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      );
}
