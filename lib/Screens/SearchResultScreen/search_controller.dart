
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Route/routes.dart';
import '../../widgets/common_dashboard_controller.dart';
import '../HomeScreen/Controller/home_controller.dart';


class SearchController extends GetxController{

  final categoryController = TextEditingController();
  final locationController = TextEditingController();

  RxBool isTopCatSearchScreen = true.obs;
  RxInt selectedLocationIndex = (-1).obs;
  RxInt selectedCategoryIndex = (-1).obs;

  @override
  void dispose() {
    categoryController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void goToPostJobScreen() {
    var locationId = commonController.locationList[selectedLocationIndex.value].id;
    var subCategoryId = homeController.subCategoryList[selectedCategoryIndex.value].catName;
    debugPrint("goToPostJobScreen");
    debugPrint("locationId : $locationId");
    debugPrint("categoryId : $subCategoryId");

    Map<String, dynamic> data = {
      "data": subCategoryId,
      "locationId": locationId.toInt()
    };

    Get.toNamed(Routes.questionScreen, arguments: data);

    /// location id and cate id set ;
  }
}