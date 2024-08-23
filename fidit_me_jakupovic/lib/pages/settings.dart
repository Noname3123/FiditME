import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  ///this constructor requires a map of functions, which are passed from parent to child
  const SettingsPage({super.key, required this.passedFunctionsList});

  final FunctionsList passedFunctionsList;
  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement settings
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('Postavke'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Jezik'),
              value: const Text('Hrvatski'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  widget.passedFunctionsList.updateDarkModeStatus!(value);
                });
              }, //if function not null then call it
              initialValue: widget.passedFunctionsList.getDarkModeStatus!(),
              leading: const Icon(Icons.mode_night_rounded),
              title: const Text('Tamna tema'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('Uloga'),
              value: const Text('Student'),
            ),
          ],
        ),
      ],
    );
  }
}
//TODO: implement language and role apps
//TODO: implement dark mode
//TODO: implement settings serialization
