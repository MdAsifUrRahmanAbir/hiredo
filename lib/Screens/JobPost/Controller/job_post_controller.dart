import 'package:get/get.dart';

import '../../HomeScreen/Model/lead_category_model.dart';
import '../Model/location_model.dart';

class JobPostController extends GetxController{

List<LocationDataModel> locationList=[
  LocationDataModel(location: "dhaka", latitude: "23.813584728069344", longitude:"90.41449459910878"),
LocationDataModel(location: "India", latitude: "22.85688857284059", longitude:"79.23119074557933")
];



List<CatName> cateName=[];
var isCategoryError=false.obs;
var isLocationError=false.obs;
var isSelectCategory=false.obs;
 LocationDataModel? locationData;
}