

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/api_services.dart';

class CommonDashboardController extends GetxController{


  getLocations() async {
    try {

      var result = await ApiServices.fetchLeadOurCategories();
      if (result.runtimeType == int) {

          debugPrint("Error $result");

      }
      else {

      }
    } on Exception catch (e) {
        debugPrint('Fetch Error: ${e.toString()}');
    }
  }

}