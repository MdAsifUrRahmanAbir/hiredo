
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  final categoryController = TextEditingController();
  final locationController = TextEditingController();

  RxBool isTopCatSearchScreen = true.obs;
  RxInt selectedIndex = 0.obs;

  @override
  void dispose() {
    categoryController.dispose();
    locationController.dispose();
    super.dispose();
  }
}