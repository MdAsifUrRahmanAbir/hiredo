import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../../../Services/api_services_by_limon.dart';
import '../../SettingsScreen/EmailTemplate/Model/email_template_model.dart';

class MyresponseDetailesController extends GetxController {
  TextEditingController subTextCtrl = TextEditingController();
  TextEditingController messageTextCtrl = TextEditingController();

  var isSendEmailLoading = false.obs;
  var isLoading = false.obs;
  var isSelectTemplete = 0.obs;

  var emailTemplateList = <EmailTemplateModel>[].obs;

  sendEmail(
      {required int postId,
      required int userId,
      required String sub,
      required String message}) async {
    try {
      isSendEmailLoading(true);
      Map<String, dynamic> body = {
        "template_name": sub,
        "message": message,
        "to_user": userId,
        "post_list": postId
      };

      var result = await ApiServices.sendEmail(body);

      if (result.runtimeType == int) {
        Fluttertoast.showToast(msg: "Email send error");
      } else {
        subTextCtrl.clear();
        messageTextCtrl.clear();
        Fluttertoast.showToast(msg: "Email send successful");
      }
    } on Exception catch (e) {
      debugPrint("Send email error. Resion $e");
    } finally {
      isSendEmailLoading(false);
    }
  }

  getEmailTemplete() async {
    isLoading(true);
    try {
      var result = await ApiServicesByLimon.fetchEmailTemplate();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('$result');
        }
      } else {
        emailTemplateList.assignAll(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error $e');
      }
    } finally {
      isLoading(false);
    }
  }
}
