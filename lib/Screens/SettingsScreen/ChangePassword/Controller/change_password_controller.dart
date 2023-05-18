import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  var isVisibility = false.obs;
  var isVisible = false.obs;
  var isVisiblele = false.obs;

  handelChangePassword() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.changePassword(
          oldPassword: oldPasswordController.text,
          newPassword: newPasswordController.text);

      if (result) {
        isLoading(false);
        debugPrint("$result");

        debugPrint('Change Password Successful');

        Get.offAllNamed(Routes.signinPage);
      } else {
        debugPrint(" Password Change Faield");
        isLoading(false);
      }
    } on Exception catch (e) {
      debugPrint("Do Not Change Password ${e.toString()}");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
