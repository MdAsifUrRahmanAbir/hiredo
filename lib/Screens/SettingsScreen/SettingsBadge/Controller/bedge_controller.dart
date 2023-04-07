import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/SettingsScreen/SettingsBadge/Model/bedge_mode.dart';

import 'package:myapp/Services/api_services.dart';

class BedgeController extends GetxController {


  var isLoading = false.obs;
  late List<BedgeModel> bedgeList;

  @override
  void onInit() {
    super.onInit();
    fetchBedgeData();
  }

  // fetch bedge data

  fetchBedgeData() async {
    isLoading(true);

    try {
      var result = await ApiServices.fetchBedge();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          debugPrint("Error $result");
        }
      } else {
        List<BedgeModel> demoList = result;
        bedgeList = demoList;

        print(demoList);
       
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Fetch Error');
      }
    } finally {
      isLoading(false);
    }
  }
}
