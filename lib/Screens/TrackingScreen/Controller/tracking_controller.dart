
import 'package:get/get.dart';


import '../TabsScreen/trackingpost.dart';
import '../TabsScreen/trackingpostorder.dart';

class TrackingController extends GetxController {
  List<String> items = ['Pending Post', 'Complete Post'];

  List screen = [TrackingPostOrder(), TrackingPostOrderTwo()];

  var currentIndex = 0.obs;




  @override
  void onInit() {
    super.onInit();

  }

  
}
