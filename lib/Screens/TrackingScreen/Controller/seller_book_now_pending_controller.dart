import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';


import '../Model/pending_book_now_model.dart';

class SellerBookNowPendingController extends GetxController {
  var isLoading = false.obs;
  var isAcceptLoading=false.obs;
  var isRejectLoading=false.obs;
  var isCompelteLoading=false.obs;

  var acceptList=[].obs;
  var rejectList=[].obs;

  late RxList<PendingBookNowModel> pendingSellerBookNowList =
      List<PendingBookNowModel>.empty(growable: true).obs;
      late RxList<PendingBookNowModel> sellerCompleteBookNowList =
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

  acceptBookNow({required int postId, required int userId}) async {
    try {
      isAcceptLoading(true);
      Map<String, dynamic> body = {
        "postId": postId,
        "userId": userId,
        "response": true
      };

      var result = await ApiServices.bookNowAcceptAndReject(body);
      if (result) {
        debugPrint("Book now accepted");
        acceptList.add(postId);
         update();
      } else {
        debugPrint("Book now accepted error ");
      }
    } on Exception catch (e) {
      debugPrint(" Book now accepted error resion:$e ");
    } finally {

       isAcceptLoading(false);
    }
  }

   rejectBookNow({required int postId, required int userId}) async {
    try {
      isRejectLoading(true);
      Map<String, dynamic> body = {
        "postId": postId,
        "userId": userId,
        "response": true
      };

      var result = await ApiServices.bookNowAcceptAndReject(body);
      if (result){
        debugPrint("Book now accepted");
        rejectList.add(postId);
        update();
      } else {
        debugPrint("Book now accepted error ");
      }
    } on Exception catch (e) {
      debugPrint(" Book now accepted error resion:$e ");
    } finally {

       isRejectLoading(false);
    }
  }


   sellerCompleteBookNow() async {
    try {
      isCompelteLoading(true);
      var result = await ApiServices.sellerCompleteBookNow();
      if (result.runtimeType == int) {
        debugPrint("Fetch seller book now complete error ");
      } else {
        sellerCompleteBookNowList.value = result;
        debugPrint("Fetch seller complete book now  successful ");
      }
    } on Exception catch (e) {
      debugPrint("Fetch seller book now complete error resion:$e ");
    } finally {
      isCompelteLoading(false);
    }
  }
}
