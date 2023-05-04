import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/HomeScreen/Model/lead_category_model.dart';


import '../../../Services/api_service_by_parvez.dart';
import '../../../Services/api_services.dart';
import '../../WishListScreen/Model/add_service_wish_list_model.dart';

final homeController = Get.put(HomeController());


class HomeController extends GetxController {
  var isLoading = false.obs;

  late List<LeadCategoriesModel> categoryList = [];
  late List<LeadCategoriesModel> subCategoryList = [];


  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  List<String> carouselImages = [];
  
   var wishList=[].obs;
  var dotPosition =0.obs;

  @override
  void onInit() {
    super.onInit();
    allDataGet();
  }

  allDataGet() async {
    isLoading(true);
    await getLeadOurCategories();
    await getSlider();
    await fetchWishListService();
    isLoading(false);
  }

  getLeadOurCategories() async {
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
    } 
  }

  getSlider() async {
    try {
      var result = await ApiServices.fetchSlider();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print("Opps fetch slider error ");
        }
      } else {
        List demoList = result;
        demoList.forEach((element) {
          carouselImages.add(element["image"]);
        });
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Opps fetch slider error ");
      }

     
    }
  }


fetchWishListService() async {
  
    try {
      var result = await ApiServicesByParvez.fetchWishListService();
      if (result.runtimeType == int) {
        if (kDebugMode) {
          print('Error $result');
        }
      } else {
        List<ServiceWishList> demoList =result;
        for (var element in demoList) {
          wishList.add(element.categoryService.id);
          debugPrint("Wish List id : ${element.categoryService.id}");
         }
        
        debugPrint("result : $result");
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("Fetch Error $e");
      }
    } 
  }

  // add wishList


   addWishList(int wishedUserId) async {
    try {
      var result = await ApiServicesByParvez.addWishList(wishedUserId);

      if (result) {
       
          debugPrint('Wish List Added Successfull');
          wishList.add(wishedUserId);
        
        
      } else {
        debugPrint('Wish list added error ');
       
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Wish List Error : $e');
      }
    }
  }

  removeWishList(int wishedUserId) async {
    try {
      var result = await ApiServicesByParvez.removeServiceWishList(wishedUserId);
      if (result) {
          debugPrint('Wish List remove Successfull');
          wishList.remove(wishedUserId);
        
        
      } else {
        debugPrint('Wish list remove error ');
       
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Wish list remove Error : $e');
      }
    }
  }

}
