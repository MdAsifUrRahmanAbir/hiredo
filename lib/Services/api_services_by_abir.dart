import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:homelyknock/Services/api_component.dart';


import '../local/my_local.dart';
import '../widgets/logger.dart';
final log = logger(ApiServicesByAbir);

class ApiServicesByAbir {
  static var client = http.Client();



  // handle login
  static Future<bool> addStillNeedPost(
      {required String email, required String message}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': "Bearer $accessToken",
        'Content-Type': 'application/json',

      };
      var response =await client.post(
          Uri.parse(needHelpsApi),
          body:jsonEncode({
            "email": email,
            "message":message
          }),
          headers:headers);

      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          log.e(response.statusCode);
          log.e(response.statusCode);
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        log.e("addStillNeedPost Error. Reason ${e.toString()}");
      }
      return false;
    }
  }


}
