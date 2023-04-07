import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:homelyknock/Screens/HomeScreen/Model/lead_category_model.dart';

import 'package:http/http.dart' as http;
import 'package:homelyknock/Services/api_component.dart';

class ApiServicesByAbir {
  static var client = http.Client();


  static dynamic fetchLocations() async {
    try {
      var response = await client.get(Uri.parse(leadcategory));

      if (response.statusCode == 200) {
        print("data : ${jsonDecode(response.body)}");

        return leadCategoriesModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print("Data fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }


}
