import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local/my_local.dart';
import '../../../widgets/logger.dart';
import '../../LeadsScreen/Model/leads_model.dart';
import '../../Service/Model/service_model.dart';
import 'package:flutter/material.dart';
final log = logger(ProfileController);
class ProfileController extends GetxController {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   getData();
  //   super.onInit();
  // }
  //

  @override
  void dispose() {
    // TODO: implement dispose
    leadsList.clear();
    serviceList.close();
    super.dispose();
  }

  var isLoading = false.obs;
  var isLeadLoading =false.obs;

  RxList<ServiceModel> serviceList =
      List<ServiceModel>.empty(growable: true).obs;
  RxList<LeadsModel> leadsList = List<LeadsModel>.empty(growable: true).obs;

  getData() async {
    isLoading(true);
    // await getServices();
    
    debugPrint("Get leads data check in on time ");
    isLoading(false);
  }

  hendleLogout(BuildContext context) async {
    try {
      isLoading(true);
      var result = await ApiServices.logoutUser();
      if (result) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isOnBoard = preferences.getBool(Constance.isOnboard) ?? false;
        preferences.clear();
        MyPreference.setOnBoard(isOnBoard);
        Fluttertoast.showToast(msg: "Logout Successfull");
       Get.offAllNamed(Routes.signinPage);
    
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
          log.e(result);
      } else {
        serviceList.value = result;
        debugPrint(serviceList.length.toString());
        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }

  getLeads(bool isLead) async {
    try {
      if(isLead){
        isLeadLoading.value=true;
      }
      var result = await ApiServices.fetchLeads();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
         log.e(result);
      } else {
        leadsList.value = result;
        debugPrint(leadsList.length.toString());
        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }finally{
      if(isLead){
        isLeadLoading.value=false;
      }
    }
  }
}
