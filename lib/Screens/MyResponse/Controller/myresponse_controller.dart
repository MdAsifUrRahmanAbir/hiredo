import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/MyResponse/Model/my_response_model.dart';
import 'package:homelyknock/Screens/MyResponse/Model/my_response_search_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../../../Services/api_services.dart';

class MyResponseController extends GetxController {
  late ScrollController scrolController;
  var isSearch = false.obs;

  @override
  void onInit() {
    firstLoad();
    scrolController = ScrollController()..addListener(loadMore);
    super.onInit();
  }

  int page = 1;

  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;

  var isLoadMoreRunning = false.obs;
  TextEditingController searchController = TextEditingController();

  RxList<Result> myResponseList = List<Result>.empty(growable: true).obs;

  RxList<MyResponseSearchModel> searchMyResponseList =
      List<MyResponseSearchModel>.empty(growable: true).obs;

  MyResponseModel? demoData;

  var data = 0;

  getSearchMyResponse() async {
    isFirstLoadRunning(true);
    try {
      var result =
          await ApiServicesByLimon.fetchSearchAndFilter(searchController.text);
      if (result.runtimeType == int) {
        debugPrint("My  response search fetch error : $result");
      } else {
        //  MyResponseSearchModel searchResponseData = result;
        searchMyResponseList.clear();

        searchMyResponseList.addAll(result);
        debugPrint(
            "My Response search data length:${searchMyResponseList.length}");
      }
    } on Exception catch (e) {
      debugPrint('Something went wrong $e');
    } finally {
      isFirstLoadRunning(false);
    }
  }

  getPendingResponse() async {
    try {
      var result = await ApiServicesByLimon.fetchPendingResponse();
      if (result.runtimeType == int) {
        debugPrint("Error Pending Response data  :$result");
      } else {
        data = result['pending_count'];
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error :$e');
    }
  }

  void loadMore() async {
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrolController.position.extentAfter < 300) {
      isLoadMoreRunning.value =
          true; // Display a progress indicator at the bottom

      page += 1; // Increase _page by 1

      try {
        final res = await ApiServices.fetchLeads(page);
        if (res.runtimeType == int) {
          debugPrint("Response fetch error : $res");
        } else {
          demoData = res;
          if (demoData!.totalPages >= page) {
            myResponseList.addAll(demoData!.result);
          } else {
            hasNextPage.value = false;
            debugPrint("Response.length==${myResponseList.length}");
          }
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      } finally {
        isLoadMoreRunning.value = false;
      }
    }
  }

  void firstLoad() async {
    try {
      isFirstLoadRunning.value = true;
      final res = await ApiServices.fetchMyResponse(page);
      if (res.runtimeType == int) {
        debugPrint("lead fetch error : $res");
      } else {
        await getPendingResponse();
        demoData = res;
        myResponseList.value = demoData!.result;

        print("leadsList.length:${myResponseList.length}");
      }
    } on Exception catch (e) {
      print('Something went wrong');
    } finally {
      getPendingResponse();
      isFirstLoadRunning.value = false;
    }
  }
}
