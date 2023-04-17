import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/utils/colors.dart';

import '../../../Services/api_services.dart';
import '../../../nav_bar_page/main_screen.dart';
import '../../ProfileScreen/Controller/profile_controller.dart';
import '../../ProfileScreen/profile.dart';

class ServiceController extends GetxController {

  TextEditingController descriptionController = TextEditingController();
  var isServieselect = false.obs;
  int selectedServiceId = 0;
  var isLoading = false.obs;

// add services data
  submitedService() async {
    isLoading(true);
    try {
      if (selectedServiceId != 0) {
        var result = await ApiServices.addServicePost(
            id: selectedServiceId, description: descriptionController.text);
        if (result) {
          profileController.getServices();
          profileController.getLeadCount();
          descriptionController.clear();
          Get.snackbar("Success", "Added Service",
              colorText: Colors.black,
              backgroundColor: themeColorGreen.withOpacity(0.5));

          Get.back();
        } else {
          debugPrint('Opps add service error ');
          isServieselect(false);
          selectedServiceId = 0;
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Feature Error $e');
      }
    } finally {
      isLoading(false);
    }
  }

// deleteService

  deleteService(int id) async {
    try {
      isLoading(true);
  var res = await ApiServices.deleteService(id);
  if (res) {
    Get.snackbar("Success", "Delete Service");
    profileController.getServices();
    profileController.getLeadCount();
  } else {
    Get.snackbar("Error", "Service delete error");
  }
} on Exception catch (e) {
  debugPrint("Opps delete service error : $e");
  
}finally{
  isLoading(false);
}
  }
}
