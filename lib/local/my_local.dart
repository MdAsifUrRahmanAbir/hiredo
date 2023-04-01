import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static SharedPreferences? sharedPreferences;

  static Future<void> setToken(String accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString(Constance.accessToken, accessToken);
  }

  static Future<String> getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getString(Constance.accessToken) ?? "";
  }


  static Future<void> isLoggedSave(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setBool(Constance.isLoggedIn, value);
  }

  static Future<bool> getIsLoggedIn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getBool(Constance.isLoggedIn) ?? false;
  }
}

class Constance {
  static String accessToken = "token";

  static String isLoggedIn = "isLoggedIn";
}
