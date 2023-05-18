
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
import '../../../widgets/data_controller.dart';
import '../../../widgets/logger.dart';

import '../../LocationScreen/Model/add_location_model.dart';
import '../../Service/Model/service_model.dart';
import 'package:flutter/material.dart';

final log = logger(ProfileController);

class ProfileController extends GetxController {

    final dataController = Get.put(DataController());
  @override
  void onInit() {
    fetchProfileData();
    getLeadCount();
    getMyResponseCount();
    getServices();
    getServiceLocation();
    // profileController.getLeadCount();
    // profileController.fetchProfileData();
    // profileController.getMyResponseCount();
    super.onInit();
  }

  var isLoading = false.obs;
  var isLeadLoading = false.obs;
  var isMyresponseLoading = false.obs;
  var leadsCount = 0.obs;
  var myResponseCount = 0.obs;
  late SharedPreferences preferences;
  RxList<ServiceModel> serviceList =
      List<ServiceModel>.empty(growable: true).obs;

  RxList<AddLocationModel> locationList =
      List<AddLocationModel>.empty(growable: true).obs;

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
        Get.offNamed(Routes.signIntroPage);

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
        isLoading(false);
      } else {
        debugPrint("User not logout");
        isLoading(false);
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint("Opps logout error $e");

      
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

  getLocalData() async {
    preferences = await SharedPreferences.getInstance();
    isProfessional.value =
        preferences.getBool(CommonData.isProfessional) ?? false;
    isUser.value = preferences.getBool(CommonData.isUser) ?? false;
  }

  modeChange() async {
    try {
      isLoading(true);
      debugPrint(isUser.value.toString());
      debugPrint(isProfessional.value.toString());

      var result = await ApiServices.changeUserMode(
          isUser: isUser.value, isProfessional: isProfessional.value);

      if (result) {
        isProfessional.value = !isProfessional.value;
        isUser.value = !isUser.value;
        dataController.isProfessional.value=!isProfessional.value;
        dataController.isUser.value=!isUser.value;
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

  // service location

  getServiceLocation() async {
    try {
      var result = await ApiServicesByLimon.fetchServiceLocation();
      if (result.runtimeType == int) {
        debugPrint("Error $result");
      } else {
        locationList.value = result;

        debugPrint(locationList.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Fetch Error: $e');
      }
    }
  }
}
