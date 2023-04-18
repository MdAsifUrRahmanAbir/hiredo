import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/HelpScreen/help_screen_controller.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/ReviewScreen/model/review_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/common_data.dart';

class ReviewController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    fetchReview();
    super.onInit();
  }
   ReviewsModel? reviewData;
  var isLoading = false.obs;
  var isSeeAll=false.obs;
   late SharedPreferences sharedPreferences;

  fetchReview() async {
    isLoading(true);
    try {
      sharedPreferences = await SharedPreferences.getInstance();
    var id= sharedPreferences.getInt(CommonData.id) ?? 0;
      var res = await ApiServicesByLimon.fetchReview(
         id
         );
      if (res.runtimeType == int) {
        debugPrint("Error reviews data  :$res");
        
      } else {
        reviewData = res;
        debugPrint(reviewData.toString());
      
      }
    } on Exception catch (e) {
      debugPrint('Fetch Error : $e');
    } finally {
      isLoading(false);
    }
  }
}
