import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:homelyknock/Screens/WishListScreen/Model/wish_list_model.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/local/my_local.dart';
import 'package:http/http.dart' as http;

import '../Screens/WishListScreen/Model/add_service_wish_list_model.dart';

class ApiServicesByParvez {
  static var client = http.Client();
  static dynamic fetchWishListCompany() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response =
          await client.get(Uri.parse(wishListCompanyApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return wishListModelFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  //Service
  static dynamic fetchWishListService() async {
    var accessToken = await MyPreference.getToken();

    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
      };
      var response =
          await client.get(Uri.parse(wishListServiceApi), headers: headers);

      if (response.statusCode == 200) {
        debugPrint("Data :${jsonDecode(response.body)}");
        return serviceWishListFromJson(response.body);
      } else {
        return response.statusCode;
      }
    } on Exception catch (e) {
      debugPrint("Data fetch Error. Reason ${e.toString()}");
      return 0;
    }
  }

  //Add WishList
  static dynamic addWishList(int serviceId) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {"category_service":serviceId};

      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.post(
          Uri.parse(
              wishListServiceApi),
          body: jsonEncode(body),
          headers: headers);

      if (response.statusCode == 200) {
        debugPrint('Wish List Add Successfull');
        print(response.body);
        return true;
      } else {
        print('WishList Add Failed ${response.statusCode}');
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Wish List Add Failed ${e.toString()}');
      }
      return false;
    }
  }

  static dynamic removeServiceWishList(int serviceId) async {
    var accessToken = await MyPreference.getToken();

    try {
     
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.post(
          Uri.parse(
              "$wishListServiceApi/$serviceId/"),
          headers: headers);

      if (response.statusCode == 200) {
        debugPrint('Wish list service remove Successfull');
        
        return true;
      } else {
        debugPrint('WishList Add Failed ${response.statusCode}');
        return false;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Wish List Add Failed ${e.toString()}');
      }
      return false;
    }
  }
}
