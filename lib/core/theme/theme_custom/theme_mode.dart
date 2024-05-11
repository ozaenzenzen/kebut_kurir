import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeCustom with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode _themeMode = ThemeMode.system;

  Future<ThemeMode> get themeMode async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('theme_mode_custom') != null) {
      if (prefs.getString('theme_mode_custom') == 'light') {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
    }
    return _themeMode;
  }

  Future<void> changeTheme({required bool darkMode}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (darkMode == true) {
      await prefs.setString('theme_mode_custom', 'dark');
      _themeMode = ThemeMode.dark;
    } else {
      await prefs.setString('theme_mode_custom', 'light');
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
