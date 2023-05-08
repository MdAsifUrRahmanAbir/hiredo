import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/HomeScreen/Model/lead_category_model.dart';
import 'package:homelyknock/Screens/ProfileScreen/Model/profile_model.dart';

import 'package:homelyknock/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:homelyknock/Screens/SettingsScreen/SettingsBadge/Model/bedge_mode.dart';
import 'package:homelyknock/Screens/SignInScreen/Model/login_model.dart';
import 'package:homelyknock/Screens/UpdateLeadSetting/Model/add_services_model.dart';
import 'package:homelyknock/Screens/UpdateLeadSetting/Model/location_model.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/local/my_local.dart';

import '../../Screens/QuestionScreen/Model/job_post_model.dart';
import '../Screens/DocumentScreen/Model/real_time_model.dart';
import '../Screens/LeadsScreen/Model/lead_search_model.dart';
import '../Screens/LeadsScreen/Model/leads_model.dart';
import '../Screens/MyResponse/Model/my_response_model.dart';
import '../Screens/OrderScreen/pending_request_list_model.dart';
import '../Screens/QuestionScreen/Model/booking_Model.dart';
import '../Screens/Service/Model/service_model.dart';
import '../Screens/TrackingScreen/Model/complete_post_model.dart';
import '../Screens/TrackingScreen/Model/pending_book_now_model.dart';
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
      {required Map<String, dynamic> body}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $accessToken",
      };
      var response = await client.post(Uri.parse(serviceApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          print(response.statusCode);
        }
        var data = jsonDecode(response.body);
        Fluttertoast.showToast(msg: data["message"]);
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
        return serviceModelFromJson(data);
      } else {
        if (kDebugMode) {
          return print(
              "Service fetch Error. Reason ${await response.stream.bytesToString()}");
        }
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
      {required bool isUser, required bool isProfessional}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var request = http.Request('PATCH', Uri.parse(changeUserModeApi));
      request.body =
          json.encode({"is_professional": isProfessional, "is_user": isUser});
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

  // user logOut
  static Future<bool> logoutUser() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST', Uri.parse(logoutUserApi));
      request.body = '''\r\n''';
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

// fetch leads

  static dynamic fetchLeadCount() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response =
          await client.get(Uri.parse(leadsCountApi), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Leads count error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<dynamic> fetchProfileData() async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(profileApi), headers: headers);
      if (response.statusCode == 200) {
        return profileModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print("Profile fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<bool> deleteService(int id) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.delete(
          Uri.parse("${deleteServiceApi + id.toString()}/"),
          headers: headers);
      if (response.statusCode == 204) {
        return true;
      } else {
        if (kDebugMode) {
          print("Delete service error. Reason ${response.body}");
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Delete service error. Reason ${e.toString()}");
      }
      return false;
    }
  }

  static fetchLeads(int page) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(leadsApi + page.toString()),
          headers: headers);
      if (response.statusCode == 200) {
        return leadModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Leads fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<bool> deletePendingPost(int id) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(
          Uri.parse("${pandingPostDeleteApi + id.toString()}/"),
          headers: headers);
      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint("Delete pandding post Error}");
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Delete pandding post Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

  static fetchLeadSearch(String text) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client
          .get(Uri.parse(leadSearchApi + text.toString()), headers: headers);
      if (response.statusCode == 200) {
        return leadSearchModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Leads fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<bool> leadContact(int id) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(
          Uri.parse("${leadContactApi + id.toString()}/"),
          headers: headers);
      if (response.statusCode == 200) {
        return true;
      } else {
        var data = jsonDecode(response.body);
        debugPrint("Lead Contact error ${data["message"]}");
        Get.snackbar("Error", data["message"],
            backgroundColor: Colors.red.shade500, colorText: Colors.white);
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Leads contact Error. Reason ${e.toString()}");
      }
      return false;
    }
  }

  static getPanddingRequestList(int id) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(
          Uri.parse("${panddingResquestListApi + id.toString()}/"),
          headers: headers);
      if (response.statusCode == 200) {
        return pendingRequestListModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print(
              "Pending Request list fetch Error. Reason ${response.statusCode}");
        }
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Pending request list fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static pendingPostAccetp(Map<String, dynamic> data) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.post(Uri.parse(pendingPostAcceptApi),
          body: jsonEncode(data), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint("Accept post error status code : ${response.body}");
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Accept post error  : $e");
      return 1;
    }
  }

  static completedPost() async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response =
          await client.get(Uri.parse(completePostApi), headers: headers);
      if (response.statusCode == 200) {
        return completePostModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print("Complete post fetch Error. Reason ${response.statusCode}");
        }
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Complete post fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static fetchMyResponse(int page) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client
          .get(Uri.parse(myResponseApi + page.toString()), headers: headers);
      if (response.statusCode == 200) {
        return myResponseModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print("My response fetch Error code : ${response.statusCode}");
        }
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("My response fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static dynamic fetchMyResponseCount() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response =
          await client.get(Uri.parse(myResponseCountApi), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Myresponse count error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<bool> paymentUserCreditPurchase(
      Map<String, dynamic> body) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      var response = await client.post(Uri.parse(paymentUserCreditPurchasedApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        debugPrint(response.body);
        return true;
      } else {
        debugPrint("Opps cradit purchase error ");
        return false;
      }
    } on Exception catch (e) {
      debugPrint("Payment Faild. Reason ${e.toString()}");
      return false;
    }
  }

  static Future<dynamic> sendEmail(Map<String, dynamic> body) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      var request = http.Request('POST', Uri.parse(sendCustomEmailApi));
      request.body = json.encode(body);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint(await response.stream.bytesToString());
        return true;
      } else {
        debugPrint(response.reasonPhrase);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Send email. Reason ${e.toString()}");
      return 0;
    }
  }

  static Future<dynamic> reviewAdd(Map<String, dynamic> body) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      // var request = http.Request('POST', Uri.parse(reviewAddApi));
      // request.body = json.encode(body);
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();
      var response = await client.post(Uri.parse(reviewAddApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        debugPrint(response.reasonPhrase);
        var data = jsonDecode(response.body);
        debugPrint(data);
        // Fluttertoast.showToast(msg:data["status"]);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Send review. Reason ${e.toString()}");
      return 0;
    }
  }

  static Future<dynamic> notInterestedLead(String id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.post(Uri.parse("$notInterestedLeadApi$id/"),
          headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        debugPrint(response.reasonPhrase);
        return 1;
      }
    } on Exception catch (e) {
      debugPrint("Not interested. Reason ${e.toString()}");
      return 0;
    }
  }

  // book now
  static Future<dynamic> bookNow({required List<BookNowModel> data}) async {
    try {
      var accessToken = await MyPreference.getToken();

      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var request = http.Request('POST', Uri.parse(bookNowApi));
      request.body = bookNowModelToJson(data);
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
      debugPrint("Book now  Error. Reason ${e.toString()}");
      return 1;
    }
  }

  static Future<dynamic> sellerPendingBookNow() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(sellerPendingBookNowApi),
          headers: headers);

      if (response.statusCode == 200) {
        return pendingBookNowModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Book now seller pending  error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<dynamic> buyerPendingBookNow() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response =
          await client.get(Uri.parse(buyerPendingBookNowApi), headers: headers);

      if (response.statusCode == 200) {
        return pendingBookNowModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(" Book now buyer pending  error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  static Future<dynamic> bookNowAcceptAndReject(
      Map<String, dynamic> body) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.post(
          Uri.parse(sellerPendingAcceptAndRejectBookNowApi),
          body: jsonEncode(body),
          headers: headers);

      if (response.statusCode == 200) {
        return true;
      } else {
        debugPrint(" accept and reject error : ${response.body}");
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(
            " Book now accept and reject error. Reason ${e.toString()}");
      }
      return false;
    }
  }

  static Future<dynamic> sellerCompleteBookNow() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(sellerCompleteBookNowApi),
          headers: headers);

      if (response.statusCode == 200) {
        return pendingBookNowModelFromJson(response.body);
      } else {
        debugPrint(" Book now seller complete  error. Reason ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(
            " Book now seller complete  error. Reason ${e.toString()}");
      }
      return 0;
    }
  }


   static Future<dynamic> buyerCompleteBookNow() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(buyerCompleteBookNowApi),
          headers: headers);

      if (response.statusCode == 200) {
        return pendingBookNowModelFromJson(response.body);
      } else {
        debugPrint(" Book now buyer complete  error. Reason ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(
            " Book now buyer complete  error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

static realTimeServiceSearch(String serviceName,String location)async{
  debugPrint("searchdata : $serviceName and $location");
  var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.get(Uri.parse(realTimeServiceSearchApi(serviceName, location)),
          headers: headers);

      if (response.statusCode == 200) {
        return realTimeServiceModelFromJson(response.body);
      } else {
        debugPrint(" Book now buyer complete  error. Reason ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        return print(
            " Book now buyer complete  error. Reason ${e.toString()}");
      }
      return 0;
    }

}


}
