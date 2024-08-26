import 'package:fidit_me_jakupovic/mainpageframe.dart';
import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/role_settings.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  // This widget is the root of your application.
  final ColorScheme colorSchemeLight =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 55, 83));

  final ColorScheme colorSchemeDark = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 23, 55, 83),
      brightness: Brightness.dark);
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  var currentThemeMode =
      ThemeMode.light; //TODO: update theme mode to the one saved on phone
  var currentLocale = const Locale('en');
  RoleSettings?
      currentRole; //TODO: remain set as null in final - since load/save system would overload these intro settings. If it is null, then the dialog would open
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIDITme',
      locale: currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: widget.colorSchemeLight,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: widget.colorSchemeLight.primary,
            foregroundColor: widget.colorSchemeLight.onPrimary),
        drawerTheme: DrawerThemeData(
          backgroundColor: widget.colorSchemeLight.primary,
        ),
        dividerTheme:
            DividerThemeData(color: widget.colorSchemeLight.onPrimary),
        listTileTheme: ListTileThemeData(
            textColor: widget.colorSchemeLight.onPrimary,
            iconColor: widget.colorSchemeLight.onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
      darkTheme: ThemeData(
        // This is the theme of your application.
        colorScheme: widget.colorSchemeDark,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: widget.colorSchemeDark.primary,
            foregroundColor: widget.colorSchemeDark.onPrimary),
        drawerTheme: DrawerThemeData(
          backgroundColor: widget.colorSchemeDark.primary,
        ),
        dividerTheme: DividerThemeData(color: widget.colorSchemeDark.onPrimary),
        listTileTheme: ListTileThemeData(
            textColor: widget.colorSchemeDark.onPrimary,
            iconColor: widget.colorSchemeDark.onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
      themeMode: currentThemeMode,
      home: MainPageFrame(
        title: 'FIDITme',
        passedFunctionsList: FunctionsList(
          getDarkModeStatus: getDarkModeStatus,
          updateDarkModeStatus: updateDarkModeStatus,
          getLocale: getLocale,
          setLocale: setLocale,
          getRole: getRole,
          setRole: setRole,
        ),
      ),
    );
  }

  ///this method updates dark mode color scheme according to values passed to param value
  void updateDarkModeStatus(bool value) {
    setState(() {
      currentThemeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }

  ///this method maps light and dark mode to appropriate bool values => dark mode == true, light mode== false
  bool getDarkModeStatus() {
    if (currentThemeMode == ThemeMode.dark) {
      return true;
    }
    return false;
  }

  ///this method takes a two character language code (String) and loads in a new locale for the app
  void setLocale(String langCode) {
    setState(() {
      currentLocale = Locale(langCode);
    });
  }

  ///getter for the current locale of the app. Return Locale object
  Locale getLocale() {
    return currentLocale;
  }

  ///this method takes a role Setting and updates the currentRole field
  void setRole(RoleSettings role) {
    setState(() {
      currentRole = role;
    });
  }

  ///getter for the current role of the app. Returns RoleSettings object
  RoleSettings? getRole() {
    return currentRole;
  }
}
