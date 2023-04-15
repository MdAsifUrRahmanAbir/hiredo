

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Route/routes.dart';
import '../../Services/api_services_by_abir.dart';
import '../../widgets/logger.dart';


final log = logger(HelpScreenController);

class HelpScreenController extends GetxController{
  final searchController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();


  @override
  void onInit() {
    /// get helps api get method or response
    super.onInit();
  }


  @override
  void dispose() {
    searchController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }


  void sendButtonClicked() {
    if(emailController.text.isNotEmpty && messageController.text.isNotEmpty){
      _updateStillNeedHelpAPI(emailController.text, messageController.text);
    }else{
      Get.snackbar("Blank Field", "Please submit email and message here");
    }
  }

  void _updateStillNeedHelpAPI(String email, String message)  async{
    try{
      var result = await ApiServicesByAbir.addStillNeedPost(email: email, message: message);

      if(result){
        Get.snackbar("Need Help", "Need Help post Successfully done.");
        Get.offAllNamed(Routes.mainPage);
      }else{
        log.i("ApiServicesByAbir.addStillNeedPost method return false");
      }
    } on Exception catch (e) {
        log.i("Opps fetch slider error $e");
    }

  }

}