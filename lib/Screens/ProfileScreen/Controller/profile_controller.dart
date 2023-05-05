import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/ProfileScreen/Model/profile_model.dart';

import 'package:homelyknock/Services/api_services.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local/my_local.dart';
import '../../../widgets/common_data.dart';
import '../../../widgets/logger.dart';

import '../../Service/Model/service_model.dart';
import 'package:flutter/material.dart';

final log = logger(ProfileController);

class ProfileController extends GetxController {
  @override
  void onInit() {
    fetchProfileData();
    getLeadCount();
    getMyResponseCount();
    super.onInit();
  }

  var isLoading = false.obs;
  var isLeadLoading = false.obs;
  var isMyresponseLoading=false.obs;
  var leadsCount = 0.obs;
  var myResponseCount=0.obs;
  late SharedPreferences preferences;
  RxList<ServiceModel> serviceList =
      List<ServiceModel>.empty(growable: true).obs;

  ProfileModel? profileData;
  var isProfessional = false.obs;
  var isUser = false.obs;

  RxString imagePath = ''.obs;

  getImage(bool isAdd) async {
    try {
      final ImagePicker picked = ImagePicker();
      final image = await picked.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagePath.value = image.path.toString();
        if (isAdd) {
          addImage();
        } else {
          updateImage();
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Faild $e');
      }
    }
  }
  // add image

  addImage() async {
    try {
      var result = await ApiServicesByLimon.uploadeProfilePic(imagePath.value);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          debugPrint("$result");
          log.e(result);
          Get.snackbar('Error', 'Image Upload Faild');
        }
      } else {
        fetchProfileData();
        Get.snackbar('success', 'Image Upload success');
      }
    } on Exception catch (e) {
      debugPrint("Error $e");
    }
  }

  updateImage() async {
    try {
      var result = await ApiServicesByLimon.updateProfilePic(imagePath.value);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          debugPrint("$result");
          log.e(result);
          Get.snackbar('Error', 'Image Upload Faild');
        }
      } else {
        fetchProfileData();
        Get.snackbar('success', 'Image Upload success');
      }
    } on Exception catch (e) {
      debugPrint("Error $e");
    }
  }

//<----------- fetch profile data------------>
  fetchProfileData() async {
    try {
      isLoading(true);
      var result = await ApiServices.fetchProfileData();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
        log.e(result);
      } else {
        profileData = result;
        isProfessional.value = result!.user.isProfessional;
        isUser.value = result!.user.isUser;
        debugPrint(isProfessional.value.toString());
         debugPrint(isUser.value.toString());

        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch profile data error : $e");
      }
    } finally {
      isLoading(false);
    }
  }

//<-----------  logout------------>

  hendleLogout(BuildContext context) async {
    try {
      isLoading(true);
      var result = await ApiServices.logoutUser();
      if (result) {
        Get.offAllNamed(Routes.signinPage);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        bool isOnBoard = preferences.getBool(Constance.isOnboard) ?? false;
        String email = preferences.getString(
              "rememberEmail",
            ) ??
            "";
        String password = preferences.getString(
              "rememberPassword",
            ) ??
            "";

        preferences.clear();
        preferences.setString("rememberEmail", email);
        preferences.setString("rememberPassword", password);
        MyPreference.setOnBoard(isOnBoard);
        Fluttertoast.showToast(msg: "Logout Successfull");
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
        debugPrint("service list length: ${serviceList.length.toString()}");
        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }

  getLeadCount() async {
    try {
      isLeadLoading.value = true;

      var result = await ApiServices.fetchLeadCount();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
        log.e(result);
      } else {
        leadsCount.value = result["total_lead"];

        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    } finally {
      isLeadLoading.value = false;
    }
  }

getLocalData()async{
  preferences = await SharedPreferences.getInstance();
  isProfessional.value =
        preferences.getBool(CommonData.isProfessional) ?? false;
    isUser.value = preferences.getBool(CommonData.isUser) ?? false;

}

  modeChange() async {
    try {
      isLoading(true);
        print(isUser.value);
         print(isProfessional.value);

      var result = await ApiServices.changeUserMode(
          isUser: isUser.value, isProfessional: isProfessional.value);

      if (result) {
        isProfessional.value = !isProfessional.value;
        isUser.value = !isUser.value;
        preferences = await SharedPreferences.getInstance();
        preferences.setBool(CommonData.isProfessional, isProfessional.value);
        preferences.setBool(CommonData.isUser, isUser.value);
      } else {
        debugPrint("User not mode change");
      }
    } on Exception catch (e) {
      debugPrint("User not mode change error : $e");
    } finally {
      isLoading(false);
    }
  }


   getMyResponseCount() async {
    try {
      isMyresponseLoading.value = true;

      var result = await ApiServices.fetchMyResponseCount();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
        log.e(result);
      } else {
       myResponseCount.value = result["my_response_count"];

        log.i(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    } finally {
      isMyresponseLoading.value = false;
    }
  }
}
