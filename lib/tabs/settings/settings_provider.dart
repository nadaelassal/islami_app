import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  SharedPreferences? prefs;
  late String language;
  bool get isDark => themeMode == ThemeMode.dark;

  String get backgroundImagePath =>
      'assets/images/${isDark ? 'dark_bg' : 'default_bg'}.png';
  void changeThemeMode(ThemeMode selectedThemeMode) {
    themeMode = selectedThemeMode;
    setThemeToCash(themeMode);
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    language = selectedLanguage;
    setLanguageToCash(language);
    notifyListeners();
  }

  Future setThemeToCash(ThemeMode themeMode) async {
    prefs = await SharedPreferences.getInstance();
    String themeName = themeMode == ThemeMode.light ? 'Light' : 'Dark';
    await prefs!.setString('theme', themeName);
  }

  loadTheme() async {
    prefs = await SharedPreferences.getInstance();
    final String? themeName = prefs!.getString('theme');

    if (themeName != null) {
      themeMode = themeName == 'Light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }

  Future setLanguageToCash(String language) async {
    prefs = await SharedPreferences.getInstance();

    String languageName = language == 'en' ? 'English' : 'Arabic';
    await prefs!.setString('language', languageName);
  }

  loadLanguage() async {
    prefs = await SharedPreferences.getInstance();

    final String? languageName = prefs!.getString('language');

    if (languageName != null) {
      language = languageName == 'English' ? 'en' : 'ar';
      notifyListeners();
    }
  }
}
