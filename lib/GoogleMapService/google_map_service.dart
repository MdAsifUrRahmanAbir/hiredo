import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'google_map_component.dart';

class GoogleMapsApiService {

static var client = http.Client();

 static Future<dynamic> getSearchLocation(String text)async{

 try {
      var response = await client.get(Uri.parse("$googleMapsBaseUrl?input=$text&key=$key"));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
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