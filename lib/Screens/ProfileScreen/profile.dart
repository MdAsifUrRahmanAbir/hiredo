import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/HelpScreen/help_screen.dart';
import 'package:homelyknock/Screens/LeadsScreen/lead_screen.dart';
import 'package:homelyknock/Screens/MyResponse/my_response.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Screens/WishListScreen/wish_list_screen.dart';
import 'package:homelyknock/utils/colors.dart';
import '../../nav_bar_page/main_controller.dart';
import '../../widgets/data_controller.dart';
import '../LocationScreen/locationpage.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Profile extends StatefulWidget {
  static const String routename = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _dataController = Get.put(DataController());
  final _mainController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              _mainController.initIndex.value = 0;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Profile',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Row(
             
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height:63.h,
                      width: 63.h,
                     decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width:1,color: Colors.grey.shade500),
                      color: Colors.grey.shade400
                     ),
                    ),
                   
                    Positioned(
                        bottom: -20.h,
                        right: -20.h,
                        child: IconButton(
                            onPressed: () {},
                            icon:  Icon(
                              Icons.camera_alt,
                              size:25.sp,
                            )))
                  ],
                ),
                SizedBox(width:15.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _dataController.fullName.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      
                        style: myStyle(16.sp, FontWeight.w500, textClr),
                      ),
                      Text(
                        _dataController.email.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: myStyle(14.sp, FontWeight.w400, const Color(0xff424242)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Image.asset("images/switchimg.png",height:26.h,width: 26.w,),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(Icons.more_vert)
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 150.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: containerClr),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Your profile is 80% complete",
                          style: myStyle(16, FontWeight.w500, textClr)),
                      Image.asset(
                        "images/editicon.png",
                        height: 22.h,
                        width: 22.w,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LinearPercentIndicator(
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 8.h,
                          percent: 0.8,
                          barRadius: Radius.circular(30.r),
                          progressColor: backIconClr,
                          backgroundColor: scaffoldClr,
                        ),
                      ),
                      Text(
                        '8/10',
                        style: myStyle(14, FontWeight.w500, textClr),
                      )
                    ],
                  ),
                  Text(
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                    style: myStyle(14, FontWeight.w400, Color(0xff424242)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 167.h,
             
             
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: containerClr),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OverView',
                    style: myStyle(20.sp, FontWeight.w500, textClr),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/eliteicon.png'),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            'Elite Pro',
                            style: myStyle(14.sp, FontWeight.w500, textClr),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/tick.png'),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '14 Hires on Ringknock',
                            style: myStyle(14.sp, FontWeight.w500, textClr),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/moon.png'),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '7 Years in business',
                            style: myStyle(14.sp, FontWeight.w500, textClr),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/tick.png'),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            '6 Hour response  time',
                            style: myStyle(14.sp, FontWeight.w500, textClr),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_rounded,
                        size: 18.sp,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '11-50 Staff',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF272727)),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 152.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              color: containerClr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service Tags',
                    style: myStyle(20, FontWeight.w500, textClr),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '#Bathroom_installation',
                              style: myStyle(14, FontWeight.w400, backIconClr),
                            ),
                            Text(
                              '#Kitchen Refurbishment',
                              style: myStyle(14, FontWeight.w400, textClr),
                            ),
                            Text(
                              '#Kitchen Refurbishment',
                              style: myStyle(14, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '#Bathroom_installation',
                              style: myStyle(14, FontWeight.w400, textClr),
                            ),
                            Text(
                              '#Kitchen Design',
                              style: myStyle(14, FontWeight.w400, textClr),
                            ),
                            Text(
                              'View More',
                              style: myStyle(14, FontWeight.w400, backIconClr),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            _cardItem(
                onTap: () {
                  Get.to(LeadsScreen());
                },
                icon: Icons.star_border_outlined,
                text: 'Leads',
                isCount: true,
                count: 450.toString()),
            _cardItem(
                onTap: () {
                  Get.to(MyResponse());
                },
                icon: Icons.sports_handball_rounded,
                text: 'My Responces',
                isCount: true,
                count: 450.toString()),
            _cardItem(
              onTap: () {
                Get.to(WishListScreen());
              },
              icon: Icons.favorite_border,
              text: 'Wishlist',
            ),
            _cardItem(
              onTap: () {
                Get.to(SettingsPage());
              },
              icon: Icons.settings,
              text: 'Settings',
            ),
            _cardItem(
              onTap: () {
                Get.to(HelpScreen());
              },
              icon: Icons.help_outline,
              text: 'Help',
            ),
            _cardItem(
                onTap: () {
                  Get.to(Service());
                },
                icon: Icons.rotate_right,
                text: 'Services',
                isCount: true,
                count: 50.toString()),
            _cardItem(
                onTap: () {
                  Get.to(LocationPage());
                },
                icon: Icons.location_pin,
                text: 'Locations',
                isCount: true,
                count: 50.toString()),
            SizedBox(
              height: 37.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SignInPage()),
                    (route) => false);
              },
              child: Container(
                  height: 43.h,
                  width: 124.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(0xffDF2929)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        color: scaffoldClr,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Logout',
                        style: myStyle(16, FontWeight.w500, scaffoldClr),
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }

  _cardItem(
      {required String text,
      String? count,
      required Function() onTap,
      required IconData icon,
      bool? isCount = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: text == "Leads"
                      ? themeColorGreen
                      : const Color(0xFF272727),
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  text,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              children: [
                isCount!
                    ? Container(
                        height: 18.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: themeColorGreen.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          count!,
                          style: TextStyle(
                              fontSize: 12.sp, color: themeColorGreen),
                        )),
                      )
                    : SizedBox(),
                const Icon(
                  Icons.navigate_next,
                  color: themeColorGreen,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
