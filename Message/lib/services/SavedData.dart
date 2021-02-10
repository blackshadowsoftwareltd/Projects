import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoData {
  static String userNameKey = 'UserNameKey';
  static String userEmailKey = 'UserMail';

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userEmailKey, userName);
  }

  static Future<bool> saveUserMail(String userMail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, userMail);
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userEmailKey);
  }

  static Future<String> getUserMail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userEmailKey);
  }
}
