import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../Model/real_time_model.dart';

class RealTimeServiceController extends GetxController {
  var isLoading = false.obs;
  var isSearch=false.obs;
  


  List<RealTimeServiceModel> realTimeServiceModel = [];
  RxList<RealTimeServiceModel> realTimeServiceSearchList = <RealTimeServiceModel>[].obs;

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

   fetchRealTimeServiceSearchData(String service,String location) async {
    isLoading(true);

    try {
      var result = await ApiServices.realTimeServiceSearch(service,location);

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        realTimeServiceSearchList.value = result;
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
