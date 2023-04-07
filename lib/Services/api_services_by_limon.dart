import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:homelyknock/Services/api_component.dart';

import '../local/my_local.dart';
import 'package:http/http.dart' as http;

class ApiServicesByLimon {
  static Future<bool> changePassword(
      {required String oldPassword, required String newPassword}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        
      };

      var request = http.MultipartRequest('POST', Uri.parse(changePasswordApi));

      request.fields.addAll({
        'old_password': oldPassword,
        'new_password': newPassword
      })  ;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
debugPrint(jsonDecode(response.toString()));
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("User Change Password Error. Reason ${e.toString()}");
      }
      return false;
    }
  }
}
