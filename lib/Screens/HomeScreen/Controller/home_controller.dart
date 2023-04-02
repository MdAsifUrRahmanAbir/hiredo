import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/HomeScreen/Model/lead_category_model.dart';
import 'package:myapp/Services/api_services.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  late List<LeadCategoriesModel> categoryList=[];
  late List<LeadCategoriesModel> subCategoryList=[];

    final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  List<String> carouselImages = [
    "https://www.colorhexa.com/c8ced9.png",
    "https://www.colorhexa.com/c8ced9.png",
    "https://www.colorhexa.com/c8ced9.png"
  ];
  var dotPosition = 0;
  bool changed = false;

  

  @override
  void onInit() {
    super.onInit();
    getLeadOurCategories();
  }

  getLeadOurCategories() async {
    isLoading(true);
    try {
      var result = await ApiServices.fetchLeadOurCategories();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Error $result");
        }
      } else {
        categoryList = result;
        categoryList.forEach((element) { 
            element.children.forEach((ele) {
              subCategoryList.add(ele);
              
            });

        });
        print(subCategoryList.length);

        if (kDebugMode) {
          print(categoryList);
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Fetch Error: ${e.toString()}');
      }
    } finally {
      isLoading(false);
    }
  }
}
