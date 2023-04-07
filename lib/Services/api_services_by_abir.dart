import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:homelyknock/Services/api_component.dart';

import '../common_dashboard_services/models/get_location_model.dart';

class ApiServicesByAbir {
  static var client = http.Client();


  static dynamic fetchLocations() async {
    try {
      var response = await client.get(Uri.parse(fetchAllLocationApi));

      if (response.statusCode == 200) {
        debugPrint("data : ${jsonDecode(response.body)}");

        return getLocationModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }


}
