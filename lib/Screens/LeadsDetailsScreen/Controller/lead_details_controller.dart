import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/Model/sms_template_model.dart';
import 'package:homelyknock/Services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Services/api_services_by_limon.dart';
import '../../LeadsScreen/Controller/lead_controller.dart';
import '../../SettingsScreen/EmailTemplate/Model/email_template_model.dart';

class LeadDetailsController extends GetxController {
  // var isContect = [].obs;
  final _leadController = Get.put(LeadController());
  var isContectLoading = false.obs;

  handleContact(int id) async {
    try {
      isContectLoading(true);
      var result = await ApiServices.leadContact(id);
      if (result) {
        _leadController.isContect.add(id);
        profileController.getMyResponseCount();
        debugPrint("Contect sucessfull");
      } else {
        debugPrint("Contect error reson");
      }
    } on Exception catch (e) {
      debugPrint("Contect error reson $e");
      // TODO
    } finally {
      isContectLoading(false);
    }
  }

  TextEditingController subTextCtrl = TextEditingController();
  TextEditingController messageTextCtrl = TextEditingController();

  TextEditingController smsTextCtrl = TextEditingController();

  var isSendEmailLoading = false.obs;
  var isLoading = false.obs;
  var isSelectTemplete = 0.obs;
  var isSelectSmsTemplete = 0.obs;

  var emailTemplateList = <EmailTemplateModel>[].obs;
  var smsTemplateList = <SmSTemplateModel>[].obs;

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

  getData() async {
    isLoading(true);
    await getEmailTemplete();
    await getSmsTemplete();
    isLoading(false);
  }

  getEmailTemplete() async {
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
    }
  }

  getSmsTemplete() async {
    try {
      var result = await ApiServicesByLimon.fetchSMSTemplate();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('$result');
        }
      } else {
        smsTemplateList.assignAll(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error $e');
      }
    }
  }

  Future<void> sendLaunchUrl({required Uri uri}) async {
    try {
      if (!await canLaunchUrl(uri)) {
        throw 'Could not launch $uri';
      }

      await launchUrl(uri);
    } on Exception catch (e) {
      debugPrint("$e");
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  var isNotInterestedLoading = false.obs;

  hendleNotInterested(int id) async {
    try {
      isNotInterestedLoading.value = true;
      var result = await ApiServices.notInterestedLead(id.toString());
      if (result.runtimeType == int) {
        debugPrint("Error not enterested");
      } else {
        _leadController.isNotInterested.add(id);
      }
    } on Exception catch (e) {
      debugPrint("Not enterested error : $e");
    } finally {
      isNotInterestedLoading(false);
    }
  }
}
