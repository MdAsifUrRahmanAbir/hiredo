import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:homelyknock/Screens/HelpScreen/help_screen_controller.dart';
import 'package:homelyknock/Screens/LocationScreen/Model/add_location_model.dart';

import 'package:homelyknock/Screens/ReviewScreen/model/review_model.dart';

import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Model/email_template_model.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/Model/sms_template_model.dart';
import 'package:homelyknock/Screens/TrackingScreen/Model/pending_post_model.dart';

import '../Screens/DocumentScreen/Model/real_time_model.dart';
import '../Screens/HelpScreen/model/help_model.dart';

import '../Screens/MyResponse/Model/my_response_search_model.dart';
import '../Screens/Service/Model/service_model.dart';
import '../Screens/SettingsScreen/MyCredits/Model/user_credit_model.dart';
import '../local/my_local.dart';
import 'package:http/http.dart' as http;

import 'api_component.dart';

class ApiServicesByLimon {
  static var client = http.Client();

// change password
  static dynamic changePassword(
      {required String oldPassword, required String newPassword}) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {'old_password': oldPassword, 'new_password': newPassword};
      final headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.post(
        Uri.parse(changePasswordApi),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint('Password changed successfully');
        return true;
      } else {
        if (kDebugMode) {
          print(
              "change password error. status code ${response.statusCode} & ${response.body}");
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

// SMS Template Post

  static dynamic smsTemplate({
    required String smsTemplate,
    required String messageTemplate,
  }) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {
        'template_name': smsTemplate,
        'message': messageTemplate,
      };

      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json'
      };

      var response = await client.post(Uri.parse(smsTemplateApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        debugPrint('SMS Template Successfull');
        print(response.body);
        return true;
      } else {
        if (kDebugMode) {
          print('SMS Add Failed ${response.statusCode} & ${response.body}');
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('SMS Template Add Failed ${e.toString()}');
      }
      return false;
    }
  }

// Email Template Post
  static dynamic emailTemplate(
      {required String templateName, required String message}) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {'template_name': templateName, 'message': message};

      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.post(Uri.parse(emailTemplateApi),
          body: body, headers: headers);

      if (response.statusCode == 201) {
        debugPrint('Email Template Successfull');
        return true;
      } else {
        if (kDebugMode) {
          print('Data Add Failed: ${response.statusCode} & ${response.body}');
        }
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Email Template Add Failed ${e.toString()}');
      }
      return false;
    }
  }

// Fetch SMS Template

  static dynamic fetchSMSTemplate() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response =
          await client.get(Uri.parse(smsTemplateApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return smSTemplateModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

// fetch Email Template

  static dynamic fetchEmailTemplate() async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response =
          await client.get(Uri.parse(emailTemplateApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");

        return emailTemplateModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  // fetch review
  static dynamic fetchReview(int id) async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client
          .get(Uri.parse("${getReviewApi + id.toString()}/"), headers: headers);
      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return reviewsModelFromJson(response.body);
      } else {
        log.e(response.body);
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  // fetch pending search and filtering

  static dynamic fetchSearchAndFilter(String text) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response = await client.get(Uri.parse(myResponseSearchApi + text),
          headers: headers);
      if (response.statusCode == 200) {
        return myResponseSearchModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Pending Response fetch Error. Reason ${e.toString()}");
      }
      return 0;
    }
  }

  // fetch pending my response

  static dynamic fetchPendingResponse() async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response =
          await client.get(Uri.parse(pendingResponseGetApi), headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  // fetch help
  static dynamic fetchHelp() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.get(Uri.parse(helpGetApi), headers: headers);
      if (response.statusCode == 200) {
        debugPrint("Data : ${jsonDecode(response.body)}");
        return helpsModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
    }
    return 0;
  }

// fetch credit
  static dynamic fetchCredit() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response =
          await client.get(Uri.parse(getCreditApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return jsonDecode(response.body);
      } else {
        debugPrint(" Error : ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  // fetch user credit

  static dynamic paymentSetCredit() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response =
          await client.get(Uri.parse(paymentSetCreditApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return userCreaditModelFromJson(response.body);
      } else {
        debugPrint(" Error : ${response.body}");
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  static dynamic updateSMS(Map<String, dynamic> body, int id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.put(Uri.parse("$smsTemplateApi$id/"),
          body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("SMS tamplate updeate error");
        return 1;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Not Update Data $e');
      }
    }
    return 1;
  }

// Update Email Template

  static dynamic updateEmail(Map<String, dynamic> body, int id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.put(Uri.parse("$emailTemplateApi$id/"),
          body: json.encode(body), headers: headers);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        debugPrint("Email tamplate updeate error");
        return 1;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Not Update Data $e');
      }
    }
    return 1;
  }

// delete email template

  static dynamic deleteById(int id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      var response = await client.delete(Uri.parse("$emailTemplateApi$id/"),
          headers: headers);
      if (response.statusCode == 204) {
        return jsonEncode(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Delete Data Error : $e');
      }
      return 1;
    }
  }

  static dynamic deleteSMSById(int id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.delete(Uri.parse("$smsTemplateApi$id/"),
          headers: headers);
      if (response.statusCode == 204) {
        return jsonEncode(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Delete Data Error : $e');
      }
      return 1;
    }
  }

//fetch RealTimeServices

  static dynamic fetchRealTimeService() async {
    try {
      var response = await client.get(Uri.parse(realTimeServiceApi));

      if (response.statusCode == 200) {
        return realTimeServiceModelFromJson(response.body);
      } else {
        print('Error');
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

// fetch pending post

  static dynamic fetchPending() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response =
          await client.get(Uri.parse(pendingPostApi), headers: headers);
      if (response.statusCode == 200) {
        return pendingPostModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  // payment user credit purchase method

  static Future<dynamic> paymentUserCreditPurchase(String body) async {
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
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Payment Faild. Reason ${e.toString()}");
      return 0;
    }
  }

  static Future<dynamic> uploadeProfilePic(String file) async {
    var accessToken = await MyPreference.getToken();

    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(profilePicPostApi),
      )
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        })
        ..files.add(await http.MultipartFile.fromPath("picture", file));
      var response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        if (kDebugMode) {
          print('Error image upload statuscode : ${response.statusCode}');
        }
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Image Upload Faild. Reason ${e.toString()}");
      return 0;
    }
  }

  static Future<dynamic> updateProfilePic(String file) async {
    var accessToken = await MyPreference.getToken();

    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.parse(profilePicUpdateApi),
      )
        ..headers.addAll({
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken'
        })
        ..files.add(await http.MultipartFile.fromPath("picture", file));
      var response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        if (kDebugMode) {
          print('Error image upload statuscode : ${response.statusCode}');
        }
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Image Upload Faild. Reason ${e.toString()}");
      return 0;
    }
  }

  // add location service

  static Future<dynamic> addServicePost(
      {required Map<String, dynamic> body}) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
      var response = await client.post(Uri.parse(addLocationServicePost),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode == 201) {
        debugPrint(response.body);
        return true;
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Add Location Faild. Reason ${e.toString()}");
      return 0;
    }
  }

  // fetch service location

  static dynamic fetchServiceLocation() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response =
          await client.get(Uri.parse(addLocationServicePost), headers: headers);
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(response.body));
        return addLocationModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  static dynamic deleteLocation(int id) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client
          .delete(Uri.parse("$addLocationServicePost$id/"), headers: headers);

      if (response.statusCode == 204) {
        return jsonEncode(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Delete Data Error : $e');
      }
      return 0;
    }
  }
}
