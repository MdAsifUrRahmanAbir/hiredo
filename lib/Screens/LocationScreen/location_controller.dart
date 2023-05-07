import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/GoogleMapService/Model/prediction_model.dart';
import 'package:homelyknock/Screens/LocationScreen/Model/add_location_model.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../../GoogleMapService/google_map_service.dart';
import '../JobPost/Model/location_model.dart';

class LocationController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController locationSearchCtrl = TextEditingController();

  TextEditingController serviceController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  var selectServiceList = [].obs;

  var isLoading = false.obs;

  RxList<AddLocationModel> locationList =
      List<AddLocationModel>.empty(growable: true).obs;

  LocationDataModel? locationData;

  @override
  void onInit() {
    super.onInit();
    getServiceLocation();
  }

// google maps service
  TextEditingController searchTextController = TextEditingController();
  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(
      BuildContext context, String? text) async {
    if (text != null && text.isNotEmpty) {
      var response = await GoogleMapsApiService.getSearchLocation(text);

      if (response.runtimeType != int) {
        _predictionList = [];
        response['predictions'].forEach((prediction) =>
            _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  addLocationService() async {
    isLoading(true);
    try {
      final body = {
        "city": locationData!.location,
        "distance": distanceController.text,
        "latitude": locationData!.latitude,
        "longitude": locationData!.longitude,
        "service": selectServiceList
      };

      var result = await ApiServicesByLimon.addServicePost(body: body);

      if (result.runtimeType != int) {
        debugPrint('Data Added Successfull');
        getServiceLocation();
        Get.snackbar('Success', 'Data Added Successfull',
            colorText: Colors.white, backgroundColor: Color(0xFF0C134F));
      } else {
        debugPrint('Data added error ');
        Get.snackbar('Error', 'Data Added Faild',
            colorText: Colors.red, backgroundColor: Color(0xFF0C134F));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Added Error : $e');
      }
    } finally {
      isLoading(false);
    }
  }

  getServiceLocation() async {
    isLoading(true);
    try {
      var result = await ApiServicesByLimon.fetchServiceLocation();
      if (result.runtimeType == int) {
        print("Error $result");
      } else {
        locationList.value = result;

        print(locationList);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Fetch Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteByLocation(int id) async {
    try {
      var result = await ApiServicesByLimon.deleteLocation(id);

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Delete Faild: $result ');
        }
      } else {
        getServiceLocation();
        Get.snackbar('Delete Data', 'Data Delete Successful');
      }
    } on Exception catch (e) {
      print('Not Delete Data ${e.toString()}');
    }
  }
}
