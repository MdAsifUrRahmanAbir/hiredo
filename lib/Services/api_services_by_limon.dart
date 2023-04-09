import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Model/email_template_model.dart';
import 'package:homelyknock/Services/api_component.dart';

import '../local/my_local.dart';
import 'package:http/http.dart' as http;

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

  static dynamic smsTemplate(
      {required String smsTemplate,
      required String messageTemplate,
      required int user
      }) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {
        'template_name': smsTemplate,
        'message': messageTemplate,
        'user': user
      };

      var headers = {
        'Authorization': 'Bearer $accessToken',
      };

      var response = await client.post(Uri.parse(smsTemplateApi),
          body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
        debugPrint('SMS Template Successfull');
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

// fetch Email Template

  static dynamic fetchEmailTemplate() async {
    var accessToken = await MyPreference.getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response = await client.get(Uri.parse(fetchEmailTemplateApi));
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
}
