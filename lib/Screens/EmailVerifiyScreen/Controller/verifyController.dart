import 'package:get/get.dart';

import 'dart:async';

class VerificationController extends GetxController {
  var onEditing = true.obs;
  var code = ''.obs;
  var secounds = 0.obs;
  var isLoading = false.obs;
  var timeShow = "".obs;

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

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }

    super.dispose();
  }
}
