import 'package:shared_preferences/shared_preferences.dart';

class SharedProvider {
  static SharedPreferences prefs;

  static void saveBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return prefs.getBool(key) ?? defaultValue;
  }

  static void saveInt(String key, int value) {
    prefs.setInt(key, value);
  }

  static int getInt(String key, {defaultValue = 0}) {
    return prefs.getInt(key) ?? defaultValue;
  }

  static void saveDouble(String key, double value)  {
    prefs.setDouble(key, value);
  }

  static double getDouble(String key, {defaultValue = 0}) {
    return prefs.getDouble(key) ?? defaultValue;
  }

  static void saveString(String key, String value)  {
    prefs.setString(key, value);
  }

  static String getString(String key, String defaultValue, ) {
    return prefs.getString(key) ?? defaultValue;
  }

  static void clear()  {
    prefs.clear();
  }
}