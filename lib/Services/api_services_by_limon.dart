import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:homelyknock/Screens/HelpScreen/help_model.dart';

import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Model/email_template_model.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/Model/sms_template_model.dart';
import 'package:homelyknock/Screens/TrackingScreen/Model/pending_post_model.dart';

import '../Screens/DocumentScreen/Model/real_time_model.dart';
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

  // Update SMS Template

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

  static Future<dynamic> uploadeProfilePic(File file) async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var request = http.MultipartRequest('POST', Uri.parse(profilePicPostApi));

      request.files
          .add(await http.MultipartFile.fromPath('picture', file.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(await response.stream.bytesToString());
        return true;
      } else {
        print('Error');
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Image Upload Faild. Reason ${e.toString()}");
      return 0;
    }
  }

  static dynamic fetchHelpTopic() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.get(Uri.parse(helpGetApi), headers: headers);
      if (response.statusCode == 200) {
        return helpModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }
}
