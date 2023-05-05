import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../Model/pending_book_now_model.dart';

class SellerBookNowPendingController extends GetxController {
  var isLoading = false.obs;
  late RxList<PendingBookNowModel> pendingSellerBookNowList =
      List<PendingBookNowModel>.empty(growable: true).obs;

  getPenddingBookNow() async {
    try {
      isLoading(true);
      var result = await ApiServices.sellerPendingBookNow();
      if (result.runtimeType == int) {
        debugPrint("Fetch seller book now pending error ");
      } else {
        pendingSellerBookNowList.value = result;
        debugPrint("Fetch seller pending book now  successful ");
      }
    } on Exception catch (e) {
      debugPrint("Fetch seller book now pending error resion:$e ");
    } finally {
      isLoading(false);
    }
  }
}
