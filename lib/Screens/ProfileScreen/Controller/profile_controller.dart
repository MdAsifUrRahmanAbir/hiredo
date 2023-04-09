import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local/my_local.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  hendleLogout() async {
    try {
      isLoading(true);
      var result = await ApiServices.logoutUser();
      if (result) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isOnBoard = preferences.getBool(Constance.isOnboard) ?? false;
        preferences.clear();
        MyPreference.setOnBoard(isOnBoard);
        Fluttertoast.showToast(msg: "Logout Successfull");
        Get.offAll(SignInPage());
      } else {
        isLoading(false);
        debugPrint("User not logout");
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint("Opps logout error ");

      // TODO
    } finally {
      isLoading(false);
    }
  }
}
