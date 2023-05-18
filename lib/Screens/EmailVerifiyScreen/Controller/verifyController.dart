import 'package:get/get.dart';

import 'dart:async';


class VerificationController extends GetxController{

  var onEditing = true.obs;
 var code = ''.obs;
   var secounds = 0.obs;

   var isValue = false.obs;
  
  late Timer timer;
 
  void startTimer() {
    timer.cancel();
    secounds.value = 60;
    timer = Timer.periodic(const Duration(seconds:1), (ter) {
      if (secounds.value > 0) {
     
          secounds.value--;
    
      }  else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    
    timer.cancel();
    super.dispose();
  }
}