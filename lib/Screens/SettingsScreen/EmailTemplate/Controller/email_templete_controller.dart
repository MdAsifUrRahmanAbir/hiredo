import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Model/email_template_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

class EmailTemplateController extends GetxController {
  final TextEditingController templeteNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  var isLoading = false.obs;

  final Rx<List<EmailTemplateModel>> _emailTemplateModel =
      Rx<List<EmailTemplateModel>>([]);
  List<EmailTemplateModel> get emailTemplateModel => _emailTemplateModel.value;

  @override
  void onInit() {
    super.onInit();
    getEmailList();
  }

// Email Template add
  addToEmailTemplate() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.emailTemplate(
          templateName: templeteNameController.text,
          message: messageController.text);
      if (result) {
        if (kDebugMode) {
          print("Add Template $result");
           debugPrint('Template Added Successfull');
          Get.snackbar('Success', 'Template Add Successfull',
              colorText: Colors.white);
       

          isLoading(true);
        }
      } else {
        Get.snackbar('Error', 'Template Add Fail', colorText: Colors.white);
          
        isLoading(false);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Template Error $e');
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }

  getEmailList() async {
    _emailTemplateModel.bindStream(getEmailTemplateData());
  }

// fetchEmailTemplate
  Stream<List<EmailTemplateModel>> getEmailTemplateData() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      var result = await ApiServicesByLimon.fetchEmailTemplate();
      List<EmailTemplateModel> demoList = result;
      yield demoList;
    }
  }
}
