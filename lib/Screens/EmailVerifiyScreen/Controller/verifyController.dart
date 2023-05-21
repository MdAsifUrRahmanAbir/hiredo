import 'package:get/get.dart';

import 'dart:async';

class VerificationController extends GetxController {
  var onEditing = true.obs;
  var code = ''.obs;
  var secounds = 0.obs;

  var isValue = false.obs;

  Timer? timer;

  void startTimer() {
    timer?.cancel();
    secounds.value = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (ter) {
      if (secounds.value > 0) {
        secounds.value--;
      } else {
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  }
}
