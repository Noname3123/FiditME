import 'package:fidit_me_jakupovic/mainpageframe.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 23, 55, 83));
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIDITme',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary),
        drawerTheme: DrawerThemeData(
          backgroundColor: colorScheme.primary,
        ),
        dividerTheme: DividerThemeData(color: colorScheme.onPrimary),
        listTileTheme: ListTileThemeData(
            textColor: colorScheme.onPrimary,
            iconColor: colorScheme.onPrimary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
      ),
      home: const MainPageFrame(title: 'FIDITme'),
    );
  }
}
