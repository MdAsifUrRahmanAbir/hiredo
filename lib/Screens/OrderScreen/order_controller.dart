import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';

class OrderController extends GetxController{

var isLoading=false.obs;


  fetchRequestList(int id)async{
    try {
      isLoading(true);
  var result = await ApiServices.getPanddingRequestList(id);
  if(result.runtimeType==int){
    debugPrint("Opps pandding RequestList Error");
    isLoading(false);
  }
} on Exception catch (e) {
  isLoading(false);
 
}



  }





}