
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:myapp/nav_bar_page/main_controller.dart';
import 'package:myapp/utils/colors.dart';



import '../utils/app_icon.dart';



class MainScreen extends StatelessWidget {

    final _mainController =Get.put(MainScreenController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        body: Obx(
            () => _mainController.pages.elementAt(_mainController.initIndex.value)),
      bottomNavigationBar: Obx(
            () => SizedBox(
              height: 66.h,
              child: BottomNavigationBar(
                  onTap: (index) {
                    _mainController.onItemTapped(index);
                  },
                  
                  selectedItemColor: Colors.white,
                  backgroundColor:Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _mainController.initIndex.value,
                 
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset(
                           AppIcons.home,
                          fit: BoxFit.fill,
                          color:_mainController.initIndex.value==0?themeColorGreen:greyColor,
                          height: 23.h,
                        ),
                        label: ""
                        ),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                           AppIcons.lead,
                          fit: BoxFit.fill,
                          color:_mainController.initIndex.value==1?themeColorGreen:greyColor,
                          height: 23.h,
                        ),
                          label: ""
                        ),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          AppIcons.order,
                          fit: BoxFit.fill,
                          color:_mainController.initIndex.value==2?themeColorGreen:greyColor,
                          height: 23.h,
                          
                        ),
                          label: ""
                        ),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                           AppIcons.search,
                          fit: BoxFit.fill,
                          color:_mainController.initIndex.value==3?themeColorGreen:greyColor,
                          height: 23.h,
                        ),
                          label: ""
                        ),
                    BottomNavigationBarItem(
                        icon: Image.asset(
                           AppIcons.profile,
                          fit: BoxFit.fill,
                          color:_mainController.initIndex.value==4?themeColorGreen:greyColor,
                          height: 23.h,
                        ),
                          label: ""
                        ),
                  ]),
            ),
          ),
    );

  
  }
}


