
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/JobPost/Model/location_model.dart';

import '../../GoogleMapService/Model/prediction_model.dart';
import '../../GoogleMapService/google_map_service.dart';
import '../../Route/routes.dart';
import '../../widgets/common_dashboard_controller.dart';
import '../HomeScreen/Controller/home_controller.dart';
import '../HomeScreen/Model/lead_category_model.dart';


class SearchController extends GetxController{

  final categoryController = TextEditingController();
  final locationController = TextEditingController();

  RxBool isTopCatSearchScreen = true.obs;
  RxInt selectedLocationIndex = (-1).obs;
  RxInt selectedCategoryIndex = (-1).obs;
  var isLoading=true.obs;
  
 late RxList<LeadCategoriesModel> subcategory=List<LeadCategoriesModel>.empty(growable: true).obs;
 late RxList<Prediction> predictionList=List<Prediction>.empty(growable: true).obs;


  LeadCategoriesModel? selectCategory;
   LocationDataModel? locationData;

  @override
  void onInit() {
    subcategory.value=homeController.subCategoryList;
    super.onInit();
  }

  @override
  void dispose() {
    categoryController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void goToPostJobScreen() {
    // var locationId = commonController.locationList[selectedLocationIndex.value].id;
    // var subCategoryId = homeController.subCategoryList[selectedCategoryIndex.value].catName;
    // debugPrint("goToPostJobScreen");
    // debugPrint("locationId : $locationId");
    // debugPrint("categoryId : $subCategoryId");
   
    Map<String, dynamic> data = {
                          "data": selectCategory!.catName,
                          "locationData":locationData,
                          "bookingUserId":null,
                        };

    Get.toNamed(Routes.questionScreen, arguments: data);

    /// location id and cate id set ;
  }




searchSubCategory(String text) async {
    if (text.isNotEmpty) {
      List<LeadCategoriesModel> dataList = homeController.subCategoryList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
        subcategory.value = dataList;
    } else {
        subcategory.value =homeController.subCategoryList;
    }
   
  }


 

searchLocation(String? text) async {
    try {
      isLoading(true);
  if(text != null && text.isNotEmpty) {
    var response = await GoogleMapsApiService.getSearchLocation(text);
    
    
    if (response.runtimeType!=int) {
      predictionList.value = [];
      response['predictions'].forEach((prediction)
      => predictionList.add(Prediction.fromJson(prediction)));
    } else {
      // ApiChecker.checkApi(response);
    }
     debugPrint(predictionList.length.toString());
  }
} on Exception catch (e) {
  debugPrint("Search result error $e");
  
}finally{
  isLoading(false);
}
    
  }




}