import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String languageCode = 'en';

  void changeLanguage(String newLanguageCode) {
    languageCode = newLanguageCode;
    notifyListeners();
  }

  void enableLightTheme() {
    themeMode = ThemeMode.light;
    notifyListeners();
  }

  void enableDarkTheme() {
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  String getBackGroundImage() {
    return themeMode == ThemeMode.dark
        ? 'assets/images/dark_background.png'
        : 'assets/images/background.png';
  }
  String getSplashScreenImage() {
    return themeMode == ThemeMode.dark
        ? 'assets/images/splash_dark.png'
        : 'assets/images/splash.png';
  }

  bool isDarkEnable() {
    return themeMode == ThemeMode.dark;
  }
}
