import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
import 'package:percent_indicator/percent_indicator.dart';

class Profile extends StatefulWidget {
  static const String routename = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double scw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/profilepic.png",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Built wright inc',
                        style: myStyle(16.sp, FontWeight.w500, textClr),
                      ),
                      Text(
                        'info@builtwrightinc.com',
                        style:
                            myStyle(14.sp, FontWeight.w400, Color(0xff424242)),
                      ),
                    ],
                  ),
                  Image.asset("images/switchimg.png"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(Icons.more_vert)
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
                width: 371.w,
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
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                                style:
                                    myStyle(14, FontWeight.w400, backIconClr),
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
                                style:
                                    myStyle(14, FontWeight.w400, backIconClr),
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
              Container(
                height: 55.h,
                width: double.infinity,
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => WishListScreen()));
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  fontSize: 16.sp, fontWeight: FontWeight.w600),
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
              Container(
                  height: 43.h,
                  width: 124.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(0xffDF2929)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined, color: scaffoldClr, size: 18,),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Logout',
                       style: myStyle(16, FontWeight.w500, scaffoldClr),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
