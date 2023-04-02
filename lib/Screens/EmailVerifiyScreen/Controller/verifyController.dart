import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';

class VerificationController extends GetxController{

  var onEditing = true.obs;
 var code = ''.obs;
CountdownController countdownController =
    CountdownController(duration: Duration(minutes: 1));

   var counter = 0.obs;

   var isValue = false.obs;
  var click = 0.obs;
  late Timer timer;
  Color timertxcol = themeColorGreen;
  void startTimer() {
    counter.value = 60;
    timer = Timer.periodic(Duration(milliseconds: 1550), (timer) {
      if (counter.value > 0) {
     
          counter.value--;
    
      } else if (counter.value == 0) {
        timertxcol = Colors.red;
      } else {
        timer.cancel();
      }
    });
  }
}