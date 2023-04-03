import 'package:get/get.dart';

import '../Screens/DocumentScreen/document.dart';
import '../Screens/HomeScreen/home.dart';
import '../Screens/ProfileScreen/profile.dart';
import '../Screens/SearchResultScreen/catsearchpage.dart';
import '../Screens/TrackingScreen/tracking_screen.dart';

class MainScreenController extends GetxController {

  var initIndex =0.obs;

final pages = [
  Home(),
  Document(),
  TrackingScreen(),
  SearchResult(),
  Profile(),
];

  void onItemTapped(int index) {
   initIndex.value=index;
  }



}