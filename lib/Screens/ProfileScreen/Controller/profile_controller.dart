import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local/my_local.dart';
import '../../LeadsScreen/Model/leads_model.dart';
import '../../Service/Model/service_model.dart';

class ProfileController extends GetxController {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   getData();
  //   super.onInit();
  // }
  //

  var isLoading = false.obs;

  RxList<ServiceModel> serviceList =
      List<ServiceModel>.empty(growable: true).obs;
  RxList<LeadsModel> leadsList = List<LeadsModel>.empty(growable: true).obs;

  getData() async {
    isLoading(true);
    await getServices();
    await getLeads();
    isLoading(false);
  }

  hendleLogout() async {
    try {
      isLoading(true);
      var result = await ApiServices.logoutUser();
      if (result) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isOnBoard = preferences.getBool(Constance.isOnboard) ?? false;
        preferences.clear();
        MyPreference.setOnBoard(isOnBoard);
        Fluttertoast.showToast(msg: "Logout Successfull");
        Get.offAll(SignInPage());
      } else {
        isLoading(false);
        debugPrint("User not logout");
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint("Opps logout error ");

      // TODO
    } finally {
      isLoading(false);
    }
  }

  getServices() async {
    try {
      var result = await ApiServices.fetchServices();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        serviceList.value = result;
        debugPrint(serviceList.length.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }

  getLeads() async {
    try {
      var result = await ApiServices.fetchLeads();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        leadsList.value = result;
        debugPrint(leadsList.length.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }
}
