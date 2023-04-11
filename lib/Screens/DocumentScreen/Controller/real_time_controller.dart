import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../Model/real_time_model.dart';

class RealTimeServiceController extends GetxController {
  var isLoading = false.obs;


  List<RealTimeServiceModel> realTimeServiceModel = [];

  @override
  void onInit() {
    super.onInit();
    fetchRealTimeServiceData();
  }

  fetchRealTimeServiceData() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.fetchRealTimeService();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        realTimeServiceModel = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}
