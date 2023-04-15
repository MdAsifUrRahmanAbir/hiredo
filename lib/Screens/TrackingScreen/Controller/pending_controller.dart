import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

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

  getPendingPost() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.fetchPending();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        pendingPostList.value = result;
        demoPandingPostList.value = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
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
}
