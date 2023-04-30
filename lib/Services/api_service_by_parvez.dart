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
  static dynamic addWishList(int wishedUserId) async {
    var accessToken = await MyPreference.getToken();

    try {
      final body = {'wished_user': wishedUserId};

      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };

      var response = await client.post(
          Uri.parse(
              'http://ringknock.pythonanywhere.com//lead/WishlistServiceViewSet/'),
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
}
