// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:myapp/Screens/DocumentScreen/document.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';
import 'package:myapp/Screens/SearchScreen/search.dart';
import 'package:myapp/Screens/FavoriteScreen/favourite.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';
import 'package:myapp/Screens/ProfileScreen/profile.dart';
import 'package:myapp/Screens/BalanceScreen/blancpage.dart';
import 'package:myapp/Screens/TrackingScreen/trackingpost.dart';
import 'package:myapp/utils/colors.dart';

class BottomNavController extends StatefulWidget {
  static const String routename = '/navbarpage';
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

final pages = [
  Home(),
  Document(),
  TrackingPostOrder(),
  SearchResult(),
  Profile(),
];

class _BottomNavControllerState extends State<BottomNavController> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (pages[0] != Home()) {
              pages[0] = Home();
            }
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              activeIcon: Icon(Icons.home, size: 25, color: themeColorGreen),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.rocket_launch_outlined,
                size: 30,
              ),
              activeIcon: Icon(Icons.rocket_launch_outlined,
                  size: 25, color: themeColorGreen),
              label: 'Ride'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.fact_check_rounded,
                size: 30,
              ),
              activeIcon: Icon(Icons.fact_check_rounded,
                  size: 25, color: themeColorGreen),
              label: 'Ride'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              activeIcon: Icon(Icons.search, size: 25, color: themeColorGreen),
              label: 'Ride'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              activeIcon: Icon(Icons.person, size: 25, color: themeColorGreen),
              label: 'Profile'),
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
