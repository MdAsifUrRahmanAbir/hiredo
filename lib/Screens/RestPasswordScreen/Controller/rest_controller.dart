

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../../ForgetPasswordScreen/Controller/forget_controller.dart';

class RestPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  var isVisibility = false.obs;

  var isVisiable = false.obs;

  var isLoading = false.obs;

  final _forgetController = Get.put(ForgetController());

  forgetPassword() async {
    isLoading(true);
    try {
      final body = {
        "phone_or_email": _forgetController.phoneController.text,
        "password": passwordController.text
      };

      var result = await ApiServicesByLimon.forgetPassword(body);
      if (result == int) {
        debugPrint('Do not change password $result');
        Get.snackbar('Error', 'Forgot Password Faild',
            colorText: Colors.red, backgroundColor: const Color(0xFF0C134F));
      } else {
        debugPrint("Password has been reset successfully");
        Get.snackbar('Success', 'Password has been reset successfully',
            colorText: Colors.white, backgroundColor: const Color(0xFF0C134F));
        Get.toNamed(Routes.signinPage);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Forgot password faild Error : $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
