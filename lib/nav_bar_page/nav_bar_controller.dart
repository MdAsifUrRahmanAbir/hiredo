// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/Screens/DocumentScreen/document.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';

import 'package:myapp/Screens/ProfileScreen/profile.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../Screens/HomeScreen/home.dart';
import '../Screens/TrackingScreen/tracking_screen.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

final controller = PersistentTabController(initialIndex: 0);

final pages = [
  Home(),
  Document(),
  TrackingScreen(),
  SearchResult(),
  Profile(),
];

class _BottomNavControllerState extends State<BottomNavController> {
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

    // Scaffold(
    //   bottomNavigationBar: BottomNavigationBar(
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: Colors.white,
    //     onTap: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //         if (pages[0] != Home()) {
    //           pages[0] = Home();
    //         }
    //       });
    //     },
    //     currentIndex: _currentIndex,
    //     items: [
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.home,
    //             size: 30,
    //           ),
    //           activeIcon: Icon(Icons.home, size: 25, color: themeColorGreen),
    //           label: 'Home'),
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.rocket_launch_outlined,
    //             size: 30,
    //           ),
    //           activeIcon: Icon(Icons.rocket_launch_outlined,
    //               size: 25, color: themeColorGreen),
    //           label: 'Ride'),
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.fact_check_rounded,
    //             size: 30,
    //           ),
    //           activeIcon: Icon(Icons.fact_check_rounded,
    //               size: 25, color: themeColorGreen),
    //           label: 'Ride'),
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.search,
    //             size: 30,
    //           ),
    //           activeIcon: Icon(Icons.search, size: 25, color: themeColorGreen),
    //           label: 'Ride'),
    //       BottomNavigationBarItem(
    //           icon: Icon(
    //             Icons.person,
    //             size: 30,
    //           ),
    //           activeIcon: Icon(Icons.person, size: 25, color: themeColorGreen),
    //           label: 'Profile'),
    //     ],
    //   ),
    //   body: pages[_currentIndex],
    // );
  }
}
