import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/Screens/HomeScreen/Model/lead_category_model.dart';

import 'package:myapp/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Screens/UpdateLeadSetting/Model/add_services_model.dart';
import 'package:myapp/Screens/UpdateLeadSetting/Model/location_model.dart';
import 'package:myapp/Services/api_component.dart';
import 'package:myapp/local/my_local.dart';




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

  // fetch lead our categories

  static dynamic fetchLeadOurCategories() async {
    try {
      var response = await client.get(Uri.parse(leadcategory));

      if (response.statusCode == 200) {

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

// add service
  static Future<bool> AddServicePost(
      {required String design, required String description}) async {
    var accessToken = await MyPreference.getToken();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var accessToken = preferences.getString('token');
    try {
      var headers = {
        'Authorization': "Bearer $accessToken",
        'Cookie':
            'csrftoken=pwnIa5wXWizyqYO2ybhtX0GLZ0NxqhtU; sessionid=gg5ikg2sfd8r50skh2zkn4d9uahf6lue'
      };
      var request = http.MultipartRequest('POST', Uri.parse(addService));
      request.fields
          .addAll({'service_name': design, 'service_description': description});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("User Add Servies Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

// fetch service data

  static dynamic fetchServices() async {
    var accessToken = await MyPreference.getToken();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var accessToken = preferences.getString('token');
    try {
      var headers = {
        'Authorization': "Bearer $accessToken",
        'Cookie':
            'csrftoken=pwnIa5wXWizyqYO2ybhtX0GLZ0NxqhtU; sessionid=gg5ikg2sfd8r50skh2zkn4d9uahf6lue'
      };
      var request = http.Request('GET', Uri.parse(fetchService));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return addServicesModelFromMap(data);
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

// add location

  static Future<bool> AddLocationPost(
      {required String city, required String distance}) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Cookie':
            'csrftoken=JTmUdH4YgUsvhRKiYHXELavXWYkDj2Jy; sessionid=zgackrotla65p88t23gjkrpw7qfig439'
      };
      var request = http.MultipartRequest('POST', Uri.parse(addLocation));

      request.fields.addAll({'city': city, 'distance': distance});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
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
        print("User Add Location Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

// fetch location data

  static dynamic fetchLocationData() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Cookie':
            'csrftoken=Mhh6ZEtVRRjjThE4WYMWICRo8M54bfbV; sessionid=zgackrotla65p88t23gjkrpw7qfig439'
      };
      var request = http.Request('GET', Uri.parse(fetchLocation));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return locationModelFromMap(data);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Location fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }
}
