import 'package:fidit_me_jakupovic/mainpageframe.dart';
import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:fidit_me_jakupovic/models/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/role_settings.dart';
import 'package:localstorage/localstorage.dart';
import 'package:fidit_me_jakupovic/models/definedroles.dart' as defined_roles;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //necessarry for localstorage
  await initLocalStorage();
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  //defined color scheme of app for light mode
  final ColorScheme colorSchemeLight =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 55, 83));

  //defined color scheme dark mode
  final ColorScheme colorSchemeDark = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 23, 55, 83),
      brightness: Brightness.dark);
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  var currentThemeMode = ThemeMode.light;
  var currentLocale = const Locale('en');
  RoleSettings? currentRole;

  @override
  void initState() {
    //load saved data
    updateDarkModeStatus(
        bool.parse(localStorage.getItem("darkMode") ?? "false"));
    setLocale(localStorage.getItem("currentLanguageName") ?? "en");
    setRole(defined_roles.definedRoleMap[localStorage.getItem("roleKey")]);

    super.initState();
  }

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

  ///this method updates dark mode color scheme according to values passed to param value. Additional param shouldSave (by default on false) defines whether value change should cause the new state to save. If true, it will save the new config to local storage.
  void updateDarkModeStatus(bool value, {bool shouldSave = false}) {
    setState(() {
      currentThemeMode = value ? ThemeMode.dark : ThemeMode.light;
      if (shouldSave) {
        SettingsData(
          currentLanguageName: currentLocale.languageCode,
          darkMode: getDarkModeStatus(),
          roleKey: defined_roles.getKeyBasedOnRole(currentRole),
        ).saveSettings();
      }
    });
  }

  ///this method maps light and dark mode to appropriate bool values => dark mode == true, light mode== false
  bool getDarkModeStatus() {
    if (currentThemeMode == ThemeMode.dark) {
      return true;
    }
    return false;
  }

  ///this method takes a two character language code (String) and loads in a new locale for the app.  Additional param shouldSave (by default on false) defines whether value change should cause the new state to save. If true, it will save the new config to local storage.
  void setLocale(String langCode, {bool shouldSave = false}) {
    setState(() {
      currentLocale = Locale(langCode);
      if (shouldSave) {
        SettingsData(
          currentLanguageName: langCode,
          darkMode: getDarkModeStatus(),
          roleKey: defined_roles.getKeyBasedOnRole(currentRole),
        ).saveSettings(); //Perform setting save when the locale/ role/ dark mode changes
      }
    });
  }

  ///getter for the current locale of the app. Returns Locale object
  Locale getLocale() {
    return currentLocale;
  }

  ///this method takes a role Setting and updates the currentRole field.  Additional param shouldSave (by default on false) defines whether value change should cause the new state to save. If true, it will save the new config to local storage.
  void setRole(RoleSettings? role, {bool shouldSave = false}) {
    setState(() {
      currentRole = role;
      if (shouldSave) {
        SettingsData(
          currentLanguageName: currentLocale.languageCode,
          darkMode: getDarkModeStatus(),
          roleKey: defined_roles.getKeyBasedOnRole(currentRole),
        ).saveSettings();
      }
    });
  }

  ///getter for the current role of the app. Returns RoleSettings object which can be null
  RoleSettings? getRole() {
    return currentRole;
  }
}
