import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../Model/complete_post_model.dart';
import '../Model/pending_book_now_model.dart';

class CompletePostController extends GetxController {
  var isLoading = false.obs;
  var completePostList = <CompletePostModel>[].obs;
  var demoCompletePostList = <CompletePostModel>[].obs;
  late RxList<PendingBookNowModel> buyerCompleteBookNowList =
      List<PendingBookNowModel>.empty(growable: true).obs;

  fetchCompletePost() async {
    try {
      isLoading(true);
      var result = await ApiServices.completedPost();

      if (result.runtimeType == int) {
        debugPrint("Opps complete fetch error ");
      } else {
        await buyerCompleteBookNow();
        completePostList.value = result;
        demoCompletePostList.value = result;
      }
    } on Exception catch (e) {
      debugPrint("Opps complete fetch error :$e");

      
    } finally {
      isLoading(false);
    }
  }
    buyerCompleteBookNow() async {
    try {
      
      var result = await ApiServices.buyerCompleteBookNow();
      if (result.runtimeType == int) {
        debugPrint("Fetch seller book now complete error ");
      } else {
        buyerCompleteBookNowList.value = result;
        debugPrint("Fetch seller complete book now  successful ");
      }
    } on Exception catch (e) {
      debugPrint("Fetch seller book now complete error resion:$e ");
    } 
  }

  searchPanddingPost({
    String? text,
    String? location,
  }) async {
    if (text!.isNotEmpty && location!.isNotEmpty) {
      List<CompletePostModel> dataList = demoCompletePostList
          .where((element) =>
              element.post.location
                  .toLowerCase()
                  .contains(location.toLowerCase()) &&
              element.post.category.name
                  .toLowerCase()
                  .contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
      completePostList.value = dataList;
    } else if (text.isNotEmpty) {
      List<CompletePostModel> dataList = demoCompletePostList
          .where((element) => element.post.category.name
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
      completePostList.value = dataList;
    } else if (location!.isNotEmpty) {
      List<CompletePostModel> dataList = demoCompletePostList
          .where((element) => element.post.location
              .toLowerCase()
              .contains(location.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(completePostList.length);
      }
      completePostList.value = dataList;
    } else {
      completePostList.value = demoCompletePostList;
    }
  }
}
