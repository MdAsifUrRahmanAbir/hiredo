import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Services/api_component.dart';

class ApiServices {
  static var client = http.Client();

  // handel Registration
  static Future<bool> handelRegistration(
      {required RegistrationModel model}) async {
    var request = http.MultipartRequest('POST', Uri.parse(signupApi));

    request.fields.addAll({
      "full_name": model.userName,
      "email": model.email,
      "password": model.password,
      "password2": model.confirmPassword,
      "dateofbirth": model.dateOfBirth,
      "phoneNumber": model.phoneNumber,
      "corporateName": model.corporateName,
      "corporateNumber": model.corporateNumber
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(await response.stream.bytesToString());
      }
      return true;
    } else {
      Map d = json.decode(await response.stream.bytesToString());
      Fluttertoast.showToast(msg: d['message']);
      if (kDebugMode) {
        print(d['message']);
      }
      return false;
    }
  }
}
