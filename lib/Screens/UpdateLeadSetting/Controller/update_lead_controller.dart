import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/Screens/UpdateLeadSetting/Model/add_services_model.dart';
import 'package:myapp/Screens/UpdateLeadSetting/Model/location_model.dart';
import 'package:myapp/Services/api_services.dart';
import 'package:myapp/local/my_local.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;

  TextEditingController desginController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  var accessToken = MyPreference.getToken();


  late AddServicesModel addServiceModel = AddServicesModel();
  late LocationModel locationModel = LocationModel();

  @override
  void onInit() {
    //submiteService();
    fetchServices();
    fetchLocation();
    super.onInit();
  }

// add services data
  submiteService() async {
    isLoading(true);

    try {
      var result = await ApiServices.AddServicePost(
          design: desginController.text,
          description: descriptionController.text);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Service Add Failed $result');
          Get.snackbar(
            "title",
            "Creation Failed",
            colorText: Colors.white,
          );
        }
      } else {
        print('Data Added Successful');
        print(accessToken);

        Get.snackbar(
          "title",
          "Creation Successful",
          colorText: Colors.white,
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Feature Error $e');
      }
    } finally {
      isLoading(false);
    }
  }

// fetch services data

  fetchServices() async {
    isLoading(true);

    try {
      var result = await ApiServices.fetchServices();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
          print('Error');
        }
      } else {
        addServiceModel = result;

        print("accsse: $accessToken");
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    } finally {
      isLoading(false);
    }
  }

// add location

  submiteLocation() async {
    isLoading(true);

    try {
      var result = await ApiServices.AddLocationPost(
          city: cityController.text, distance: distanceController.text);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Service Add Failed $result');
          Get.snackbar(
            "title",
            "Creation Failed",
            colorText: Colors.white,
          );
        }
      } else {
        print('Location Added Successful');

        Get.snackbar(
          "title",
          "Creation Successful",
          colorText: Colors.white,
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Feature Error $e');
      }
    } finally {
      isLoading(false);
    }
  }

// fetch location

  fetchLocation() async {
    isLoading(true);

    try {
      var result = await ApiServices.fetchLocationData();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
          print('Error Data');
        }
      } else {
        locationModel = result;
        print(locationModel);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
