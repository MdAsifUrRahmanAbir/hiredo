import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:homelyknock/widgets/data_controller.dart';

import '../../../SignInScreen/Model/login_model.dart';



class SmsTemplateController extends GetxController {
  final TextEditingController smsNameController = TextEditingController();
  final TextEditingController messageTemplateController =
      TextEditingController();
     DataController _dataController = Get.put(DataController());
      
 
 
  var isLoading = false.obs;

  addSmsTemplate() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.smsTemplate(
          smsTemplate: smsNameController.text,
          messageTemplate: messageTemplateController.text,
          user: _dataController.id.value
          );  
    

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Add Template $result");
          Get.snackbar('Error', 'SMS Template Add Fail',
              colorText: Colors.white);
          isLoading(false);
        }
      } else {
        debugPrint('SMS Template Added Successfull');
        Get.snackbar('Error', 'SMS Template Add Successfull',
            colorText: Colors.white);
        isLoading(false);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('SMS Template Error : $e');
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
