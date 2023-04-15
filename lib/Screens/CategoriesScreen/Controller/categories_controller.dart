import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../HomeScreen/Controller/home_controller.dart';
import '../../HomeScreen/Model/lead_category_model.dart';

class CategorisController extends GetxController {


  final homeController = Get.put(HomeController());
  final TextEditingController searchController = TextEditingController();
  List<String> list = <String>['All Category', "Most Popular"];
  var isSelect = "All Category".obs;

  late RxList<LeadCategoriesModel> demoList =
      List<LeadCategoriesModel>.empty(growable: true).obs;
  late RxList<LeadCategoriesModel> categoryList =
      List<LeadCategoriesModel>.empty(growable: true).obs;

  late RxList<LeadCategoriesModel> demoMostList =
      List<LeadCategoriesModel>.empty(growable: true).obs;
  late RxList<LeadCategoriesModel> categoryMostList =
      List<LeadCategoriesModel>.empty(growable: true).obs;

  late RxList<LeadCategoriesModel> sortList =
      List<LeadCategoriesModel>.empty(growable: true).obs;
      
  @override
  void onInit() {
    setData();
    super.onInit();
  }

  setData() {
    demoList.value = homeController.categoryList;
    categoryList.value = homeController.categoryList;
    for (var value in categoryList) {
      sortList.add(value);
    }
    sortingCategory();
  }

  searchMostCategory(String text) async {
    if (text.isNotEmpty) {
      List<LeadCategoriesModel> dataList = demoMostList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {}

      demoMostList.value = dataList;
    } else {
      demoMostList.value = categoryMostList;
    }
  }

  searchAllCategory(String text) async {
    if (text.isNotEmpty) {
      List<LeadCategoriesModel> dataList = demoList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {}

      demoList.value = dataList;
    } else {
      demoList.value = categoryList;
    }
  }

  sortingCategory() {
    categoryMostList.clear(); 
    demoMostList.clear();
    sortList.sort((a, b) => b.popularity.compareTo(a.popularity));
    for (var value in sortList) {
      categoryMostList.add(value);
      demoMostList.add(value);
    }
  }
}
