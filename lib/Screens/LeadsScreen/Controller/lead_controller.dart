import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:homelyknock/Screens/LeadsScreen/Model/leads_model.dart';
import 'package:homelyknock/Services/api_services.dart';

class LeadController extends GetxController {
  late ScrollController scrolController;

  @override
  void onInit() {
    firstLoad();
    scrolController = ScrollController()..addListener(loadMore);
    super.onInit();
  }

  int page = 1;

  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;

  var isLoadMoreRunning = false.obs;

  RxList<Result> leadsList = List<Result>.empty(growable: true).obs;
  LeadModel? demoData;

  void loadMore() async {
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrolController.position.extentAfter < 300) {
      isLoadMoreRunning.value =
          true; // Display a progress indicator at the bottom

      page += 1; // Increase _page by 1

      try {
        final res = await ApiServices.fetchLeads(page);
        if (res.runtimeType == int) {
          debugPrint("lead fetch error : $res");
        } else {
           demoData = res;
          if (demoData!.totalPages>=page) {
            leadsList.addAll(demoData!.result);
          } else {
            hasNextPage.value = false;
            debugPrint("leadsList.length==${leadsList.length}");
          }
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      } finally {
        isLoadMoreRunning.value = false;
      }
    }
  }

  void firstLoad() async {
    try {
  isFirstLoadRunning.value = true;
    final res = await ApiServices.fetchLeads(page);
    if (res.runtimeType == int) {
      debugPrint("lead fetch error : $res");
    } else {
       demoData = res;
      leadsList.value = demoData!.result;
      print("leadsList.length:${leadsList.length}");
    }
} on Exception catch (e) {
  print('Something went wrong');
 
}finally{
  isFirstLoadRunning.value =false;
}
    
  }
}
