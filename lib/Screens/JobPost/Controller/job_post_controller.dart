import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/GoogleMapService/google_map_service.dart';

import '../../../GoogleMapService/Model/prediction_model.dart';
import '../../HomeScreen/Model/lead_category_model.dart';
import '../Model/location_model.dart';

class JobPostController extends GetxController{

  var lat=0.0.obs;
  var leng=0.0.obs;



List<CatName> cateName=[];
var isCategoryError=false.obs;
var isSelectCategory=false.obs;
 LocationDataModel? locationData;


// google maps service 
TextEditingController searchTextController=TextEditingController();
  List<Prediction> _predictionList=[];

   Future<List<Prediction>> searchLocation(BuildContext context, String? text) async {
    if(text != null && text.isNotEmpty) {
      var response = await GoogleMapsApiService.getSearchLocation(text);
      
      
      if (response.runtimeType!=int) {
        _predictionList = [];
        response['predictions'].forEach((prediction)
        => _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }






}