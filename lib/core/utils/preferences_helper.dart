import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static Future<bool> getBool(String key) async {
    final SharedPreferences p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences p = await prefs;
    return p.setBool(key, value);
  }

  static Future<int> getInt(String key) async {
    final SharedPreferences p = await prefs;
    return p.getInt(key) ?? 0;
  }

  static Future<dynamic> setInt(String key, int value) async {
    final SharedPreferences p = await prefs;
    return p.setInt(key, value);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future<bool> setString(String key, String value) async {
    final SharedPreferences p = await prefs;
    return p.setString(key, value);
  }

  static Future<double> getDouble(String key) async {
    final SharedPreferences p = await prefs;
    return p.getDouble(key) ?? 0.0;
  }

  static Future<bool> setDouble(String key, double value) async {
    final SharedPreferences p = await prefs;
    return p.setDouble(key, value);
  }

  // helper

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}