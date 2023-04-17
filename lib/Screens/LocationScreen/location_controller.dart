import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../JobPost/Model/location_model.dart';
import '../UpdateLeadSetting/Model/location_model.dart';

class LocationController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController locationSearchCtrl = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  List<LocationDataModel> country = [
    LocationDataModel(
        location: "dhaka",
        latitude: "23.813584728069344",
        longitude: "90.41449459910878"),
    LocationDataModel(
        location: "India",
        latitude: "22.85688857284059",
        longitude: "79.23119074557933")
  ];
  LocationDataModel? locationData;
}
