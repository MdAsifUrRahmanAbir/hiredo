import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/OneClickResponce/Model/on_click_response_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:homelyknock/widgets/logger.dart';

import '../../EmailTemplate/Controller/email_templete_controller.dart';

final log = logger(OnClickResponseController);

class OnClickResponseController extends GetxController {
  final emailTempleteController = Get.put(EmailTemplateController());
  var status = false.obs;

  var isLoading = false.obs;

  var selectedValue = ''.obs;

  RxList<OnClickResponseModel> onClickResponseList =
      List<OnClickResponseModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getOnClickResponse();
  }

  getOnClickResponse() async {
    isLoading(true);
    try {
      var result = await ApiServicesByLimon.fetchOnClickResponse();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        onClickResponseList.value = result;
        emailTempleteController.getEmailList(true);
        status.value = onClickResponseList[0].oneClickResponse;
        if (onClickResponseList[0].template != null) {
          selectedValue.value = onClickResponseList[0].template.templateName;
        }
        log.i(emailTempleteController.emailTemplateModel.length);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Data Fetch Error: $e');
      }
    } finally {
      isLoading(false);
    }
  }

  changeStatus(int id, bool isStatus) async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.onclickStatusChange(id, isStatus);
      if (result.runtimeType == int) {
        log.e(result);
      } else {
        OnClickResponseModel data = result;

        status.value = data.oneClickResponse;
        if (data.template != null) {
          selectedValue.value = data.template.templateName;
        }
         log.i("onclick status change");
        isLoading(false);
      }
    } on Exception catch (e) {
      log.e("status change error : $e");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  setEmailTemplete(
    int temId,
  ) async {
    try {
      var result = await ApiServicesByLimon.onClickSetEmailTemplete(
          temId, onClickResponseList[0].id, status.value);
      if (result.runtimeType == int) {
        log.e(result);
      } else {
        OnClickResponseModel data = result;

        status.value = data.oneClickResponse;
        if (data.template != null) {
          selectedValue.value = data.template.templateName;
        }
        log.i("onclick temple set completed");
      }
    } on Exception catch (e) {
      log.e("Set email temple on click response error : $e");
    }
  }
}
