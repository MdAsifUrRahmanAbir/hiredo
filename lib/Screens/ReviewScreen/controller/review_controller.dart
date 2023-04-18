import 'package:get/get.dart';
import 'package:homelyknock/Screens/HelpScreen/help_screen_controller.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/ReviewScreen/model/review_model.dart';
import 'package:homelyknock/Services/api_services_by_limon.dart';

class ReviewController extends GetxController {
  late ReviewModel reviewData;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchReview();
  }

  fetchReview() async {
    isLoading(true);
    try {
      var res = await ApiServicesByLimon.fetchReview(
          profileController.profileData!.id);
      if (res.runtimeType == int) {
        print("data :$res");
        log.e(res);
      } else {
        reviewData = res;
        print(reviewData);
        log.i(res);
      }
    } on Exception catch (e) {
      print('Fetch Error : $e');
    } finally {
      isLoading(false);
    }
  }
}
