import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../../../Route/routes.dart';

class ForgetController extends GetxController {
  var userType = "phone".obs;
  final phoneController = TextEditingController();
  var isLoading = false.obs;

  // reset password for email

  resetPasswordOTPByEmail() async {
    isLoading(true);
    try {
      final body = {
        "phone_or_email": phoneController.text,
        "media": userType.value
      };

      var result = await ApiServicesByLimon.resetPasswordOTPEmail(body);
      if (result.runtimeType == int) {
        debugPrint('OTP not sent  $result');
      } else {
        debugPrint(result);
        Get.snackbar('Success', result,
            colorText: Colors.white, backgroundColor: const Color(0xFF0C134F));
        Get.toNamed(Routes.forgotVerification, arguments: {
          "emailOrPhone": phoneController.text,
          "type": userType.value,
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('OPT faild Error : $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
