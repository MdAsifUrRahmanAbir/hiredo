import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/widgets/logger.dart';

import 'dart:async';

import '../../../Route/routes.dart';
import '../../../Services/api_services_by_limon.dart';

final log=logger(VerificationController);

class VerificationController extends GetxController {
  var onEditing = true.obs;
  var code = ''.obs;
  var secounds = 0.obs;
  var isLoading = false.obs;
  var timeShow = ''.obs;

  var isValue = false.obs;

  Timer? timer;

  void startTimer() {
    timer?.cancel();
    secounds.value = 180;
    timer = Timer.periodic(const Duration(seconds: 1), (ter) {
      if (secounds.value > 0) {
        secounds.value--;
      } else {
        timer?.cancel();
      }
      int minutes = secounds.value ~/ 60;
      int startSecond = (secounds.value % 60);

      timeShow.value =
          "${minutes.toString().padLeft(2, "0")}.${startSecond.toString().padLeft(2, "0")}";
    });
  }

  checkOtp({required String code, phoneOrEmail}) async {
    try {
      isLoading(true);
  Map<String, dynamic> body = {"otp": code, "phone_or_email": phoneOrEmail};
  
  var result = await ApiServicesByLimon.checkOtp(body: body);
  
  if(result.runtimeType==int){
      log.e("Check otp error : $result");
  }else{
    log.i("Otp matched : $result");
     timer!.cancel();
      Get.toNamed(Routes.resetpasswordpage,arguments:phoneOrEmail);
    
  
  }
} on Exception catch (e) {
  log.e("Check otp error : Reason. $e");

}finally{
  isLoading(false);
}
  }

  resentOTP({
    required String phoneOrEmail,
    type,
  }) async {
    isLoading(true);
    try {
      final body = {"phone_or_email": phoneOrEmail, "media": type};
      var result = await ApiServicesByLimon.resetPasswordOTPEmail(body);
      if (result.runtimeType == int) {
        debugPrint('OTP not send  $result');
      } else {
        debugPrint("OTP has been resend to your email");
        startTimer();
        Get.snackbar('Success', 'OTP has been resend to your email',
            colorText: Colors.white, backgroundColor: const Color(0xFF0C134F));
      }
    } on Exception catch (e) {
      debugPrint('OPT faild Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}
