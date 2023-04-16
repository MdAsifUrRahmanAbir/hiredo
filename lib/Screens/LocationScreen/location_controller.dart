import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UpdateLeadSetting/Model/location_model.dart';

class LocationController extends GetxController {
  TextEditingController searchCtrl = TextEditingController();
  TextEditingController locationSearchCtrl = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController distanceController = TextEditingController();

  List<LocationModel> country = [];
}
