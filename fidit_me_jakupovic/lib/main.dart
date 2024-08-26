import 'package:fidit_me_jakupovic/mainpageframe.dart';
import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIDITme',
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
            updateDarkModeStatus: updateDarkModeStatus),
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
}
