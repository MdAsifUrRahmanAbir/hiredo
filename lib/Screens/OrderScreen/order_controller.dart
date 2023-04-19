import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/OrderScreen/pending_request_list_model.dart';
import 'package:homelyknock/Services/api_services.dart';

import '../TrackingScreen/Controller/pending_controller.dart';

class OrderController extends GetxController {

  final pendingPostontroller = Get.put(PendingController());
  var isLoading = false.obs;
  var isStatusLoading=false.obs;
  
  var isAccept = 0.obs;
  var isReject = [].obs;
  var isStatus=false.obs;
  var isSelectIndex=0.obs; 

  var requestList = <PendingRequestListModel>[].obs;

  fetchRequestList(int id) async {
    try {
      isLoading(true);
      var result = await ApiServices.getPanddingRequestList(id);
      if (result.runtimeType == int) {
        debugPrint("Opps pandding RequestList Error");
        isLoading(false);
      } else {
        requestList.value = result;
        debugPrint("Successfull");
      }
    } on Exception catch (e) {
      debugPrint("Pandding request list Error $e ");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

hendleAcceptAndReject(bool accept, String id,userId, int index)async{

  try {
    isStatus.value=accept;
    isSelectIndex.value=index;
    isStatusLoading.value=true;
     
   
  Map<String,dynamic> data={
    "postId": id,
    "userId":userId,
    "response": accept
  };
  var result=await ApiServices.pendingPostAccetp(data);
  
  if(result.runtimeType==int){
    debugPrint("Accept error ");
  }else{
    if(accept){
      isAccept.value=int.parse(id);
      pendingPostontroller.getPendingPost(false);
       Get.snackbar("Successful", "Accepted successful");
    }else{
        isReject.add(int.parse(id));
       Get.snackbar("Successful", "Rejected successful");

    }
   
  }
} on Exception catch (e) {
  debugPrint("Accept error resion : $e ");
  // TODO
}finally{
  isStatusLoading(false);
}




}





}
