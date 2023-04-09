import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/HomeScreen/Model/lead_category_model.dart';

import 'package:homelyknock/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:http/http.dart' as http;
import 'package:homelyknock/Screens/SettingsScreen/SettingsBadge/Model/bedge_mode.dart';
import 'package:homelyknock/Screens/SignInScreen/Model/login_model.dart';
import 'package:homelyknock/Screens/UpdateLeadSetting/Model/add_services_model.dart';
import 'package:homelyknock/Screens/UpdateLeadSetting/Model/location_model.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/local/my_local.dart';

import '../../Screens/QuestionScreen/Model/job_post_model.dart';
import '../widgets/data_controller.dart';

class ApiServices {
  static var client = http.Client();

  // handel Registration
  static Future<bool> handelRegistration({required SignUpModel model}) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(signupApi));

    request.body = jsonEncode(model.toJson());
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
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

// handle login

  static Future<dynamic> handelLogin(
      {required String email, required String password}) async {
    try {
      var request = http.Request('POST', Uri.parse(signInApi));

      request.bodyFields = {'email': email, 'password': password};

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return loginModelFromJson(data);
      } else {
        Map d = json.decode(await response.stream.bytesToString());
        debugPrint("$d");

        if (kDebugMode) {
          debugPrint(response.reasonPhrase);
        }
        return 1;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Login Error ${e.toString()}');
      }
      return 1;
    }
  }

  // fetch lead our categories
  static dynamic fetchLeadOurCategories() async {
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

// add service
  static Future<bool> addServicePost(
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
  static Future<bool> addLocationPost(
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

  static Future<dynamic> fetchSlider() async {
    try {
      var response = await client.get(Uri.parse(sliderApi));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print("Fetch Slider error : ${response.statusCode}");
          return 1;
        }
      }
    } on Exception catch (e) {
      return 1;
    }
  }

// fetch bedge data

  static dynamic fetchBedge() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Cookie':
            'csrftoken=x6eHPOJU6MQ69KZhy0Qj8OlQWHtKqxcx; sessionid=d8as8dj5ar7aq961u89ypw7484ztb6io'
      };
      var request = http.Request('GET', Uri.parse(fetchBedgeApi));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        return bedgeModelFromJson(data);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Bedge fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  // Job Post
  static Future<dynamic> jobPostCreate(
      {required List<JobPostModel> data}) async {
    try {
      var accessToken = await MyPreference.getToken();

      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
        'Cookie':
            'csrftoken=YqvXb0jbZKzIkJLJhy1KgrFX5K0aDJ3I; sessionid=s56mcfr0yahwh0jk9nuikt10ie6d8cau'
      };
      var request = http.Request('POST', Uri.parse(jobPostApi));
      request.body = jobPostModelToJson(data);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        return "success";
      } else {
        debugPrint("error:  ${response.reasonPhrase}");
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Job post  Error. Reason ${e.toString()}");
      return 1;
    }
  }

// forgot password
  Future<dynamic> forgotPassword(
      {required String email, required String type}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(forgotPasswordApi));
    request.body = json.encode({
      "media": type,
      "phone_or_email": email,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

// change user mode

  static Future<bool> changeUserMode(
      {required bool is_user, required bool is_professional}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var request = http.Request('PATCH', Uri.parse(changeUserModeApi));
      request.body =
          json.encode({"is_professional": is_professional, "is_user": is_user});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        return true;
      } else {
        debugPrint(response.reasonPhrase);
        return false;
      }
    } on Exception catch (e) {
      debugPrint("Change user mode error :  $e");

      return false;
      // TODO
    }
  }
}
