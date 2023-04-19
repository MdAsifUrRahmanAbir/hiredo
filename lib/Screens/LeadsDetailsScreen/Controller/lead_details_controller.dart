import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Services/api_services.dart';

class LeadDetailsController extends GetxController {
  var isContect = [].obs;

  var isContectLoading = false.obs;

  handleContact(int id) async {
    try {
      isContectLoading(true);
      var result = await ApiServices.leadContact(id);
      if (result) {
        isContect.add(id);
        profileController.getMyResponseCount();
         debugPrint("Contect sucessfull");
      } else {
        debugPrint("Contect error reson");
      }
    } on Exception catch (e) {
      debugPrint("Contect error reson");
      // TODO
    } finally {
      isContectLoading(false);
    }
  }
}
