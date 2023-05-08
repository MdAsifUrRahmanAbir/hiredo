
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../widgets/common_data.dart';
import '../TabsScreen/trackingpost.dart';
import '../TabsScreen/trackingpostorder.dart';

class TrackingController extends GetxController {
  List<String> items = ['Pending Post', 'Complete Post'];

  //List screen = [TrackingPostOrder(), TrackingPostOrderTwo()];

  var currentIndex = 0.obs;
  var userRole=false.obs;
  var isLoading=false.obs;
 late SharedPreferences preferences;


    getUserMode()async{
      try {
  isLoading(true);
  preferences = await SharedPreferences.getInstance();
     userRole.value =  preferences.getBool(CommonData.isProfessional)??false;
     debugPrint(userRole.value.toString());
     isLoading(false);
} on Exception catch (e) {
  isLoading(false);
  debugPrint(e.toString());
}

    }
      

     




  

  
}
