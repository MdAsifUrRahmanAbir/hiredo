import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/OneClickResponce/Model/on_click_response_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

class OnClickResponseController extends GetxController {
  var status = false.obs;

  var isLoading = false.obs;

  var selectedValue = ''.obs;

  RxList<OnClickResponseModel> onClickResponseList =
      List<OnClickResponseModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getOnClickResponse();
  }

  getOnClickResponse() async {
    isLoading(true);
    try {
      var result = await ApiServicesByLimon.fetchOnClickResponse();

      if (result.runtimeType == int) {
        print("Error $result");
      } else {
        onClickResponseList.value = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Fetch Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
