import 'package:get/get.dart';


import '../Screens/DocumentScreen/document.dart';
import '../Screens/HomeScreen/home.dart';

import '../Screens/ProfileScreen/profile.dart';
import '../Screens/SearchResultScreen/catsearchpage.dart';
import '../Screens/TrackingScreen/tracking_screen.dart';

class MainScreenController extends GetxController {
  var initIndex = 0.obs;

  @override
  void onInit() {
    initIndex.value = 0;
    super.onInit();
  }

  final pages = [
    Home(),
    Document(),
    //InboxScreen(),
    TrackingScreen(),
    SearchResult(),
    Profile(),
  ];

  void onItemTapped(int index) {
    initIndex.value = index;
  }
}
