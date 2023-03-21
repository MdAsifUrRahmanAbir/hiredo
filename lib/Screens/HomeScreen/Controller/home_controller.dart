import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/HomeScreen/Model/lead_category_model.dart';
import 'package:myapp/Services/api_services.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  late LeadCategoryModel leadCategoryModel;

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
        leadCategoryModel = result;
        print(leadCategoryModel);
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
