import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/HelpScreen/help_screen.dart';

import 'package:myapp/Screens/LeadsScreen/lead_screen.dart';
import 'package:myapp/Screens/MyResponse/my_response.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/UpdateLeadSetting/update_lead_settings.dart';
import 'package:myapp/Screens/WishListScreen/wish_list_screen.dart';
import 'package:myapp/utils/colors.dart';

import '../HomeScreen/home.dart';
import '../LocationScreen/locationpage.dart';

class Profile extends StatefulWidget {
  static const String routename = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

double _progressValue = 0.8;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double scw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.keyboard_backspace_rounded,
            color: themeColorGreen,
            size: 28.sp,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 23.sp, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Icon(
              Icons.notifications_none_outlined,
              color: themeColorGreen,
              size: 28.sp,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              children: [
                SizedBox(
                  height: 63.h,
                  width: scw - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 63.h,
                            width: 63.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.r)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90.r)),
                              child: Image.asset(
                                "images/profilepic.png",
                                height: 63.h,
                                width: 63.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Built wright inc',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'info@builtwrightinc.com',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("images/switchimg.png"),
                          SizedBox(
                            width: 15.w,
                          ),
                          const Icon(Icons.more_vert)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 150.h,
                  width: scw - 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEDED),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Your profile is 80% complete",
                              style: TextStyle(
                                  fontSize: 19.sp, fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              "images/editicon.png",
                              height: 22.h,
                              width: 22.w,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 8.h,
                              width: scw - 110,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    themeColorGreen),
                                value: _progressValue,
                              ),
                            ),
                            Text(
                              '8/10',
                              style: TextStyle(fontSize: 14.sp),
                            )
                          ],
                        ),
                        Text(
                          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                          style: TextStyle(fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 167.h,
                  width: 371.w,
                  padding: EdgeInsets.only(left: 10.w, top: 20.h, right: 10.w),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEDED),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OverView',
                        style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
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
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
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
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
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
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
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
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
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
                  height: 152.w,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
                  color: const Color(0xFFEEEDED),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service Tags',
                        style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF272727)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Bathroom_installation',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF187949)),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            '#Bathroom_installation',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Kitchen Refurbishment',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            '#Kitchen Design & Planning',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Kitchen Refurbishment',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'View More',
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF187949)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.r),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LeadsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_border_outlined,
                                color: themeColorGreen,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Text(
                                'Leads',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: themeColorGreen.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Text(
                                  '416',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: themeColorGreen),
                                )),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: themeColorGreen,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MyResponse()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.sports_handball_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Text(
                                'My Responces',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Center(
                                    child: Text(
                                  '416',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                )),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WishListScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.favorite_border,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Wishlist',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SettingsPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.settings,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HelpScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.help_outline,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Help',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => UpdateLeadSettings()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.rotate_right,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Services',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Center(
                                    child: Text(
                                  '50',
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                )),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 55.h,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LocationPage()));
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Locations',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 18.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Center(
                                  child: Text(
                                '50',
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              )),
                            ),
                            const Icon(Icons.navigate_next),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: 43.h,
                    width: scw / 2 - 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignInPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDF2929),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.login),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
