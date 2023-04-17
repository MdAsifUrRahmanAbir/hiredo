import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../Services/api_services.dart';
import '../../TrackingScreen/Controller/pending_controller.dart';
import '../Model/job_post_model.dart';

class QuestionController extends GetxController {
   final trandingPostController=Get.put(PendingController());
  RxInt selectedItemIndex = 0.obs;
  var isLoading = false.obs;
  var selectedQuestionIndex = 0.obs;

  List<JobPostModel> allAnswer = [];

  submitJobPost(BuildContext context) async {
    try {
      isLoading(true);
     
      var result = await ApiServices.jobPostCreate(data:allAnswer);
      if (result.runtimeType == int) {
        debugPrint("Opps job post not create ");
      } else {
        trandingPostController.getPendingPost(true);
       Fluttertoast.showToast(msg: "Complete job post create",toastLength: Toast.LENGTH_LONG);
        Get.back();
        Get.back();
        isLoading(false);
      }
    } on Exception catch (e) {
      isLoading(false);
      debugPrint(e.toString());
      // TODO
    } finally {
      isLoading(false);
    }
  }
}
