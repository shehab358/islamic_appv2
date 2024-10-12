import 'package:flutter/material.dart';
import 'package:islamic_appv2/app_theme.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

String get backGroundImageName => themeMode == ThemeMode.light ? 'bg3' : 'bg2';
Color get containerColor => themeMode == ThemeMode.light ? AppTheme.white : AppTheme.dark;
Color get sebhaColor => themeMode == ThemeMode.light ? AppTheme.lightPrimary : AppTheme.dark;

  void changeTheme(ThemeMode selectedtheme) {
    themeMode = selectedtheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    languageCode = selectedLanguage;
    notifyListeners();
  }
}
