import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static SharedPreferences? sharedPreferences;

  static Future<void> setOnBoard(bool isOnboard) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setBool(Constance.isOnboard,isOnboard );
  }
  // static Future<bool> getOnBoard() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences!.getBool(Constance.isOnboard) ??false;
  // }

  static Future<void> setToken(String accessToken) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString(Constance.accessToken, accessToken);
  }

  static Future<String> getToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences!.getString(Constance.accessToken) ?? "";
  }


  static Future<void> isLoggedSave({required String email, required String password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString(Constance.isLoggedEmail, email);
     sharedPreferences!.setString(Constance.isLoggedPassword, password);

  }

//   static Future<bool> getIsLoggedIn() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     return sharedPreferences!.(Constance.isLoggedIn) ?? false;
//   }
 }

class Constance {
  static String accessToken = "token";

  static String isLoggedEmail = "isLoggedEmail";
  static String isLoggedPassword="isLoggedPassword";
  static String isOnboard="isOnBoard";
  
}
