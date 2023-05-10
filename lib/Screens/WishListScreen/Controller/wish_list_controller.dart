import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:homelyknock/Screens/WishListScreen/Model/add_service_wish_list_model.dart';

import 'package:homelyknock/Screens/WishListScreen/Model/wish_list_model.dart';
import 'package:homelyknock/Services/api_service_by_parvez.dart';

import 'package:homelyknock/local/my_local.dart';

class WishListController extends GetxController {
  @override
  void onInit() {
    fetchWishListService();
    super.onInit();
  }

  var isLoading = false.obs;

  var accessToken = MyPreference.getToken();

// Company WishList
  List<CompanyWishListModel> wishlistModel = [];
  fetchWishListCompany() async {
    try {
      var result = await ApiServicesByParvez.fetchWishListCompany();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        wishlistModel = result;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    }
  }

// Service WishList
  List<ServiceWishList> serviceWishListModel = [];
  fetchWishListService() async {
    isLoading(true);

    try {
      var result = await ApiServicesByParvez.fetchWishListService();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        serviceWishListModel = result;
        await fetchWishListCompany();
        debugPrint("result : $result");
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    } finally {
      isLoading(false);
    }
  }
}
