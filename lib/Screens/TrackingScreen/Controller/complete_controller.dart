import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../Model/complete_post_model.dart';

class CompletePostController extends GetxController {
  var isLoading = false.obs;
  var completePostList = <CompletePostModel>[].obs;
  var demoCompletePostList = <CompletePostModel>[].obs;

  fetchCompletePost() async {
    try {
      isLoading(true);
      var result = await ApiServices.completedPost();

      if (result.runtimeType == int) {
        debugPrint("Opps complete fetch error ");
      } else {
        completePostList.value = result;
        demoCompletePostList.value = result;
      }
    } on Exception catch (e) {
      debugPrint("Opps complete fetch error :$e");

      // TODO
    } finally {
      isLoading(false);
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
