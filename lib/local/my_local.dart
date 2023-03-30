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
}

class Constance {
  static String accessToken = "token";
}
