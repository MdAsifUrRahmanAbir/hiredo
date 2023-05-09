import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/WishListScreen/Model/wish_list_model.dart';
import 'package:homelyknock/Services/api_services.dart';

import 'package:homelyknock/Services/api_services_by_limon.dart';

import '../../../Services/api_service_by_parvez.dart';
import '../Model/real_time_model.dart';

class RealTimeServiceController extends GetxController {
  var isLoading = false.obs;
  var isSearch = false.obs;

  List<RealTimeServiceModel> realTimeServiceModel = [];
  RxList<RealTimeServiceModel> realTimeServiceSearchList =
      <RealTimeServiceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRealTimeServiceData();
  }

  var companyWishList = [].obs;
  fetchWishListCompany() async {
    try {
      var result = await ApiServicesByParvez.fetchWishListCompany();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        List<CompanyWishListModel> demoData = result;
        companyWishList.clear();
        for (var element in demoData) {
          companyWishList.add(element.wishedUser.id);
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }

  fetchRealTimeServiceData() async {
    isLoading(true);

    try {
      var result = await ApiServicesByLimon.fetchRealTimeService();

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        await fetchWishListCompany();
        realTimeServiceModel = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }

  fetchRealTimeServiceSearchData(String service, String location) async {
    isLoading(true);

    try {
      var result = await ApiServices.realTimeServiceSearch(service, location);

      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        realTimeServiceSearchList.value = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }



 addAndRemoveCompanyWishList(int wishedUserId) async {
    try {
      var result = await ApiServicesByParvez.addAndRemoveCompanyWishList(wishedUserId);

      if (result) {
        debugPrint('Wish List Added Successfull');
        if (companyWishList.contains(wishedUserId)) {
          companyWishList.remove(wishedUserId);
        } else {
          companyWishList.add(wishedUserId);
        }
      } else {
        debugPrint('Wish list added error ');
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Wish List Error : $e');
      }
    }
  }

}
