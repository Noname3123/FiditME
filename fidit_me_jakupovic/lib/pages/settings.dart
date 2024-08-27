import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:fidit_me_jakupovic/pages/language_popup.dart';
import 'package:fidit_me_jakupovic/pages/role_select_popup.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/definedlocales.dart'
    as definedLocales;
import 'package:fidit_me_jakupovic/models/role_to_localized_name_mapper.dart';

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
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text(AppLocalizations.of(context)!.postavke),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: Text(AppLocalizations.of(context)!.jezik),
              value: Text(definedLocales.getKeyBasedOnLocale(
                  widget.passedFunctionsList.getLocale!())),
              onPressed: (BuildContext context) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguageDialog(
                        passedFunctionList: widget.passedFunctionsList);
                  },
                  barrierDismissible: true,
                );
              },
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  widget.passedFunctionsList.updateDarkModeStatus!(value,
                      shouldSave: true);
                });
              }, //if function not null then call it
              initialValue: widget.passedFunctionsList.getDarkModeStatus!(),
              leading: const Icon(Icons.mode_night_rounded),
              title: Text(AppLocalizations.of(context)!.darkMode),
            ),
            SettingsTile.navigation(
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(AppLocalizations.of(context)!.uloga),
                value: Text(
                  RoleToLocalizedNameMapper(
                          context: context,
                          getRole: widget.passedFunctionsList.getRole)
                      .getLocalizedRoleName(),
                ),
                onPressed: (BuildContext context) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RoleDialog(
                          passedFunctionList: widget.passedFunctionsList);
                    },
                    barrierDismissible: true,
                  ).then((_) {
                    setState(
                        () {}); //after show dialog finishes, then update widget
                  });
                }),
          ],
        ),
      ],
    );
  }
}
