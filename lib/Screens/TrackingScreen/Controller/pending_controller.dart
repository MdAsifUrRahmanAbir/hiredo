import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Services/api_services_by_limon.dart';
import '../Model/pending_post_model.dart';

class PendingController extends GetxController{

  var isLoading = false.obs;
    List<PendingPostModel> pendingPostModel = [];

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
        pendingPostModel = result;
        print(pendingPostModel);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}