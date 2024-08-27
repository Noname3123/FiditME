import 'package:localstorage/localstorage.dart';

///this class contains settings data which will be saved to the localstorage of device
class SettingsData {
  ///constructor of save class. It receies the dark mode bool, string key of role name and the current language code
  SettingsData({
    required this.darkMode,
    required this.roleKey,
    required this.currentLanguageName,
  });

  bool darkMode = false;
  String roleKey = "Student";
  String currentLanguageName = "en";

  ///this method saves the settings of application to local device storage. Returns void and takes no params
  void saveSettings() {
    localStorage.setItem("darkMode", darkMode.toString());
    localStorage.setItem("currentLanguageName", currentLanguageName);
    localStorage.setItem("roleKey", roleKey);
  }
}
