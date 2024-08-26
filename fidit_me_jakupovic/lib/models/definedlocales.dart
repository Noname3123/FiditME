import 'package:flutter/material.dart';

///A map of locals and their appropriate key names - map is of type String:String where the key is the name of language (shown in app) and the value is the locale lang code
var definedLanguageMap = {"Hrvatski": "hr", "English": "en"};

///This method return the key of defined language map depending on the passed Locale object. If it fails to find the key it returns the string "-1"
String getKeyBasedOnLocale(Locale locale) {
  return definedLanguageMap.keys.firstWhere(
      (key) => definedLanguageMap[key] == locale.languageCode,
      orElse: () => "-1");
}
