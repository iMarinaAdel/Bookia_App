import 'dart:convert';

import 'package:bookia/feature/auth/data/models/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences prefs;
  static final kuserData = "user_data";
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setUserData(UserData? userdata) async {
    //1) parse object to Json (Map)
    if (userdata == null) {
      return;
    }
    var userObject = userdata.toJson();
    //2) encode to string using (JsonEncode)
    var userDataString = jsonEncode(userObject);
    //3)  save to shared preferences
    await prefs.setString(kuserData, userDataString);
  }

  static UserData? getUserData() {
    //3)  save to shared preferences
    var source = prefs.getString(kuserData);
    if (source == null) return null;
    // 2) decode string to Json
    var userDataJson = jsonDecode(source);
    // 3) parse Json to object
    return UserData.fromJson(userDataJson);
  }

  static Future<bool> setString(String key, String value) {
    return prefs.setString(key, value);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }

  static Future<bool> setInt(String key, int value) {
    return prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  static Future<bool> setbool(String key, bool value) {
    return prefs.setBool(key, value);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    return prefs.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return prefs.getStringList(key);
  }

  static Future<bool> setDouble(String key, double value) {
    return prefs.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return prefs.getDouble(key);
  }
}
