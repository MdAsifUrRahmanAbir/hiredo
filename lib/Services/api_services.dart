import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Screens/HomeScreen/Model/lead_category_model.dart';
import 'package:myapp/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Services/api_component.dart';

import '../Screens/SignInScreen/Model/sign_in_model.dart';

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

// handel login
  static Future<dynamic> handelLogin(
      {required String email, required String password}) async {
    try {
      var resuest = http.MultipartRequest('POST', Uri.parse(signInApi));
      resuest.fields.addAll({'email': email, 'password': password});

      http.StreamedResponse response = await resuest.send();
      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return signInModelFromMap(data);
      } else {
        Map d = json.decode(await response.stream.bytesToString());
        Fluttertoast.showToast(msg: d['message']);
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return 0;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("login error => ${e.toString()}");
      }
      return 0;
    }
  }

  // fetch lead our categories

  static dynamic fetchLeadOurCategories() async {
    try {
      var response = await client.get(Uri.parse(leadcategory));

      if (response.statusCode == 200) {
        return leadCategoryModelFromMap(response.body);
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
