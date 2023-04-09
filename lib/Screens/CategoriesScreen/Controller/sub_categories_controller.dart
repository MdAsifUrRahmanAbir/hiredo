import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../HomeScreen/Model/lead_category_model.dart';

class SubCategorisController extends GetxController{


 late RxList <LeadCategoriesModel> demoList=List<LeadCategoriesModel>.empty(growable: true).obs;
 late RxList<LeadCategoriesModel> subcategory=List<LeadCategoriesModel>.empty(growable: true).obs;


searchSubCategory(String text) async {
    if (text.isNotEmpty) {
      List<LeadCategoriesModel> dataList = demoList
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (kDebugMode) {
        print(dataList.length);
      }
        demoList.value = dataList;
    } else {
        demoList.value =subcategory;
    }
  }







}