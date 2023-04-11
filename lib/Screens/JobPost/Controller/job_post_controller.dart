import 'package:get/get.dart';

import '../../HomeScreen/Model/lead_category_model.dart';

class JobPostController extends GetxController{

List<CatName> cateName=[];
var isCategoryError=false.obs;
var isLocationError=false.obs;
var isSelectCategory=false.obs;
int? locationId;
}