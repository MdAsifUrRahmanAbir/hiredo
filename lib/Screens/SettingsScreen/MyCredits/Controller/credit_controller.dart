import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../Model/credit_model.dart';
import '../Model/user_credit_model.dart';

class CreditController extends GetxController {
  var status = false.obs;

  var isCheck = false.obs;

  var isLoading = false.obs;

  CreaditModel? creaditData;

  RxList<UserCreaditModel> userCreditData =
      List<UserCreaditModel>.empty(growable: true).obs;

  getData() async {
    isLoading(true);
    await getCredit();
    await getUserCredit();
    isLoading(false);
  }

  getUserCredit() async {
    try {
      var result = await ApiServicesByLimon.paymentSetCredit();
      if (result.runtimeType == int) {
        debugPrint("Error User credit data  :$result");
      } else {
        userCreditData.value = result;
        debugPrint(userCreditData.toString());
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error :$e');
    }
  }

  getCredit() async {
    try {
      var result = await ApiServicesByLimon.fetchCredit();

      if (result.runtimeType == int) {
        debugPrint("Error credit data  :$result");
      } else {
        creaditData = result;
        debugPrint(creaditData.toString());
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error :$e');
    }
  }
}
