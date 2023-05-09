import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/MyCredits/Model/credit_transaction_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../Model/user_credit_model.dart';

class CreditController extends GetxController {
  var status = false.obs;

  var isCheck = false.obs;

  var isLoading = false.obs;

  var totalCredit = 0.obs;

  RxList<UserCreaditModel> userCreditData =
      List<UserCreaditModel>.empty(growable: true).obs;

  RxList<CreditTransactionModel> creditTransactionList =
      List<CreditTransactionModel>.empty(growable: true).obs;

  getData() async {
    isLoading(true);
    await getCredit();
    await getUserCredit();
    await getCreditTransaction();
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
        totalCredit.value = result["total_credit"];
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error :$e');
    }
  }

  getCreditTransaction() async {
    try {
      var result = await ApiServicesByLimon.fetchCreditTransaction();

      if (result.runtimeType == int) {
        debugPrint('Credit Transaction Error : $result');
      } else {
        creditTransactionList.value = result;
        print(creditTransactionList);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint('Fetch Error :$e');
      }
    }
  }
}
