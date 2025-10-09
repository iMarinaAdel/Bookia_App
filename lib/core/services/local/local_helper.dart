import 'dart:convert';

import 'package:bookia/feature/auth/data/models/response/auth_response/user.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_item.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences prefs;
  static final kuserData = "user_data";
  static final kwishlist = "wishlist";
  static final kToken = "token";

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static setUserData(User? userdata) async {
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

  static setToken(String? token) async {
    if (token == null) {
      return;
    }
    await prefs.setString(kToken, token);
  }

  static String? getToken() {
    return prefs.getString(kToken);
  }

  static User? getUserData() {
    //3)  save to shared preferences
    var source = prefs.getString(kuserData);
    if (source == null) return null;
    // 2) decode string to Json
    var userDataJson = jsonDecode(source);
    // 3) parse Json to object
    return User.fromJson(userDataJson);
  }

  static setWishlist(List<Product>? product) async {
    //1) parse object to Json (Map)
    if (product == null) {
      return;
    }
    var productList = product.map((e) => jsonEncode(e.toJson())).toList();

    await prefs.setStringList(kwishlist, productList);
    return null;
  }

  static setCart(List<CartItem>? product) async {
    //1) parse object to Json (Map)
    if (product == null) {
      return;
    }
    var productList = product.map((e) => jsonEncode(e.toJson())).toList();

    await prefs.setStringList(kwishlist, productList);
    return null;
  }

  static List<Product>? getWishlist() {
    var source = prefs.getStringList(kwishlist);
    if (source == null) return null;
    var listOfObj = source.map((e) => Product.fromJson(jsonDecode(e))).toList();
    return listOfObj;
  }

  static List<CartItem>? getCart() {
    var source = prefs.getStringList(kwishlist);
    if (source == null) return null;
    var listOfObj = source
        .map((e) => CartItem.fromJson(jsonDecode(e)))
        .toList();
    return listOfObj;
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
