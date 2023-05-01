import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

class CompletePostDetailsController extends GetxController{

    var reating=0.0.obs;
    TextEditingController desTextController=TextEditingController();

    var isLoading =false.obs;

    hendleReviewAdd(int id,)async{

      try {
        isLoading(true);
  Map<String , dynamic> body={
    "reviewed_user": id,
    "rating":reating.value,
    "comment":desTextController.text
  
  };
    var result= await ApiServices.reviewAdd(body);
    if(result.runtimeType==int){
        debugPrint( "Review send error.");
    }else{
         Fluttertoast.showToast(msg:result["status"]);
        Get.back();
        desTextController.clear();
        reating.value=0.0;
    }
} on Exception catch (e) {
  debugPrint("send review error : $e");
}finally{
   isLoading(false);
}


    }


}