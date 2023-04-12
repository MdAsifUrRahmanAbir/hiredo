import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/Model/sms_template_model.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:homelyknock/widgets/data_controller.dart';

class SmsTemplateController extends GetxController {
  final TextEditingController smsNameController = TextEditingController();
  final TextEditingController messageTemplateController =
      TextEditingController();
  final _dataController = Get.put(DataController());

  var isLoading = false.obs;
  var isAddLoading=false.obs;
 
  var smsTemplateModel = <SmSTemplateModel>[].obs;

  addSmsTemplate() async {
     isAddLoading(true);
    try {
      var result = await ApiServicesByLimon.smsTemplate(
          smsTemplate: smsNameController.text,
          messageTemplate: messageTemplateController.text,
          user: _dataController.id.value);

      if (result) {
        if (kDebugMode) {
          print("Add Template $result");
          debugPrint('SMS Template Added Successfull');
          getSMSTemplate(true);
          Get.snackbar('Success', 'SMS Template Added Successfull',
              colorText: Colors.white);

          
        }
      } else {
        Get.snackbar('Error', 'SMS Template Add Fail', colorText: Colors.white);
       
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('SMS Template Error : $e');
    
      }
    } finally {
          isAddLoading(false);
    }
  }


getSMSTemplate(bool isAdd)async{
  if(!isAdd){
        isLoading(true);
  }


  try {
  var result = await ApiServicesByLimon.fetchSMSTemplate();
  
  if(result.runtimeType == int){
    if(kDebugMode){
      print("$result");
    }
  }else{

    
    smsTemplateModel.assignAll(result);
    print(smsTemplateModel);
  }
} on Exception catch (e) {
  if(kDebugMode){
           print('Fetch Error $e');
  }
}finally{
if(!isAdd){
        isLoading(false);
  }
}

}

}
