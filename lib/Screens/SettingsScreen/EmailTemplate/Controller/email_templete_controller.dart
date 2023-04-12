import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Model/email_template_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:homelyknock/widgets/common_dashboard_controller.dart';

import '../../../../widgets/data_controller.dart';

class EmailTemplateController extends GetxController {
  final TextEditingController templeteNameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
    final _dataController = Get.put(DataController());

  var isLoading = false.obs;
  var isAddLoading = false.obs;

  var emailTemplateModel = <EmailTemplateModel>[].obs;

  void textFieldClear(){
    templeteNameController.clear();
    messageController.clear();
  }

@override
  dispose(){
    super.dispose();
    templeteNameController.dispose();
    messageController.dispose();
  

}
// Email Template add
  addToEmailTemplate() async {
    isAddLoading(true);

    try {
      var result = await ApiServicesByLimon.emailTemplate(
          templateName: templeteNameController.text,
          message: messageController.text);
      if (result) {
        if (kDebugMode) {
          print("Add Template $result");
          debugPrint('Template Added Successfull');
          getEmailList(true);
          Get.snackbar('Success', 'Template Add Successfull',
              colorText: Colors.white);
              textFieldClear();
        }
      } else {
        Get.snackbar('Error', 'Template Add Fail', colorText: Colors.white);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Template Error $e');
      }
    } finally {
      isAddLoading(false);
    }
  }

  getEmailList(bool isAdd) async {
    if (!isAdd) {
      isLoading(true);
    }

    try {
      var result = await ApiServicesByLimon.fetchEmailTemplate();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('$result');
        }
      } else {
        emailTemplateModel.assignAll(result);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error $e');
      }
    } finally {
      if (!isAdd) {
        isLoading(false);
      }
    }
  }

  updateData(String id) async {
    isAddLoading(true);
    try {
      final body = {
        "template_name": templeteNameController.text,
        "message": messageController.text,
   
      };

      var result = await ApiServicesByLimon.updateEmail(body, id);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Update Data  $result');
          log.i(result);
          getEmailList(true);
          Get.snackbar('Success', 'Template Update Successfull',
              colorText: Colors.white);
        }
      } else {
        debugPrint('Update Data Faild');
        log.e(result);
        Get.snackbar('Success', 'Template Update Faild',
            colorText: Colors.white);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Update Error : $e');
      }
    } finally {
      isAddLoading(false);
    }
  }



  Future<void> deleteEmail(String id) async {
    try {
      var result = await ApiServicesByLimon.deleteById(id);
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Delete Faild: $result');
        }
      } else {
        getEmailList(false);
        Get.snackbar('Delete Data', 'Success');
      }
    } on Exception catch (e) {
      print('Not Delete Item ${e.toString()}');
    }
  }
}
