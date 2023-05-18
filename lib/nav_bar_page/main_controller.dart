import 'package:get/get.dart';
import 'package:homelyknock/Screens/InboxScreen/inbox_screen.dart';

import '../Screens/DocumentScreen/document.dart';
import '../Screens/HomeScreen/home.dart';

import '../Screens/ProfileScreen/profile.dart';
import '../Screens/SearchResultScreen/catsearchpage.dart';
import '../Screens/TrackingScreen/tracking_screen.dart';
import '../widgets/common_dashboard_controller.dart';

class MainScreenController extends GetxController {
  final commonController =
      Get.put(CommonDashboardController(), permanent: true);

  var initIndex = 0.obs;
  @override
  void onInit() {
    commonController.getLocations();

    super.onInit();
  }

  final pages = [
    Home(),
    Document(),
    const InboxScreen(),
    TrackingScreen(),
    SearchResult(),
    Profile(),
  ];

  void onItemTapped(int index) {
    initIndex.value = index;
  }
}
