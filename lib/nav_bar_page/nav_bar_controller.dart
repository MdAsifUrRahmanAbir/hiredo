
import 'package:flutter/material.dart';
import 'package:myapp/Screens/DocumentScreen/document.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';

import 'package:myapp/Screens/ProfileScreen/profile.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Screens/HomeScreen/home.dart';
import '../Screens/TrackingScreen/tracking_screen.dart';

class BottomNavController extends StatelessWidget {
final controller = PersistentTabController(initialIndex: 0);

final pages = [
  Home(),
  Document(),
  TrackingScreen(),
  SearchResult(),
  Profile(),
];

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          color: Color(0xFF187949),
        ),
        inactiveIcon: Icon(
          Icons.home,
          color: Color(0xFFADB5BD),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.rocket_launch_outlined,
          color: Color(0xFF187949),
        ),
        inactiveIcon: Icon(
          Icons.rocket_launch_outlined,
          color: Color(0xFFADB5BD),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.fact_check_rounded,
          color: Color(0xFF187949),
        ),
        inactiveIcon: Icon(
          Icons.fact_check_rounded,
          color: Color(0xFFADB5BD),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.search,
          color: Color(0xFF187949),
        ),
        inactiveIcon: Icon(
          Icons.search,
          color: Color(0xFFADB5BD),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
          color: Color(0xFF187949),
        ),
        inactiveIcon: Icon(
          Icons.person,
          color: Color(0xFFADB5BD),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: pages,
      items: _navBarItem(),
    );

  
  }
}


