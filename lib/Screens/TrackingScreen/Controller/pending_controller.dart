import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/TrackingScreen/Model/pending_book_now_model.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../../../Services/api_services_by_limon.dart';
import '../Model/pending_post_model.dart';

class PendingController extends GetxController {
  var isLoading = false.obs;
  late RxList<PendingPostModel> pendingPostList =
      List<PendingPostModel>.empty(growable: true).obs;
  late RxList<PendingPostModel> demoPandingPostList =
      List<PendingPostModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // getPendingPost();
    super.onInit();
  }

  getPendingPost(bool isFast) async {
    if (isFast) {
      isLoading(true);
    }

    try {
      var result = await ApiServicesByLimon.fetchPending();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        pendingPostList.value = result;
        demoPandingPostList.value = result;
       await getPenddingBookNow();
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      if (isFast) {
        isLoading(false);
      }
    }
  }

  deletePendingPost(int id) async {
    try {
      isLoading(true);
      var result = await ApiServices.deletePendingPost(id);
      if (result) {
        getPendingPost(false);
        Get.snackbar("Success", "Delete Complete");
      } else {
        if (kDebugMode) {
          print('Opps delete pandding post error');
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Opps delete pandding post error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  searchPanddingPost({
    String? text,
    String? location,
  }) async {
    if (text!.isNotEmpty && location!.isNotEmpty) {
      List<PendingPostModel> dataList = demoPandingPostList
          .where((element) =>
              element.location.toLowerCase().contains(location.toLowerCase()) &&
              element.category.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
      pendingPostList.value = dataList;
    } else if (text.isNotEmpty) {
      List<PendingPostModel> dataList = demoPandingPostList
          .where((element) =>
              element.category.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
      pendingPostList.value = dataList;
    } else if (location!.isNotEmpty) {
      List<PendingPostModel> dataList = demoPandingPostList
          .where((element) =>
              element.location.toLowerCase().contains(location.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
      pendingPostList.value = dataList;
    } else {
      pendingPostList.value = demoPandingPostList;
    }
  }

  late RxList<PendingBookNowModel> buyerPendingBookNowList =
      List<PendingBookNowModel>.empty(growable: true).obs;

  getPenddingBookNow() async {
    try {
      var result = await ApiServices.buyerPendingBookNow();
      if (result.runtimeType == int) {
        debugPrint("Fetch buyer book now pending error ");
      } else {
        buyerPendingBookNowList.value = result;
        debugPrint("Fetch buyer pending book now  successful ");
      }
    } on Exception catch (e) {
      debugPrint("Fetch buyer book now pending error resion:$e ");
    }
  }
}
