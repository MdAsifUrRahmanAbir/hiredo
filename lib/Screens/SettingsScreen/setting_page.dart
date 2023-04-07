import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/ReviewScreen/reviews_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/AccountDetails/account_details.dart';
import 'package:homelyknock/Screens/SettingsScreen/BillingDetails/billing_details.dart';
import 'package:homelyknock/Screens/SettingsScreen/BrowserNotification/browser_notification.dart';
import 'package:homelyknock/Screens/SettingsScreen/ElitePro/elite_pro_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailNotification/email_notification.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/email_template_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/MyCredits/my_credits_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/OneClickResponce/one_click_responce_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/PaymentDetails/payment_details_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/sms_template_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/SettingsBadge/badge_page.dart';
import 'package:homelyknock/utils/colors.dart';

class SettingsPage extends StatefulWidget {
  static const String routename = '/settings';

  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map> myProfile = [
    {'icon': 'images/user.png', 'title': 'My Profile'},
    {'icon': 'images/reviews.png', 'title': 'Reviews'},
    {'icon': 'images/elite_pro.png', 'title': 'Elite pro'},
    {'icon': 'images/badge.png', 'title': 'Badges'},
    {'icon': 'images/account_details.png', 'title': 'Account Details'},
  ];

  List<Map> communications = [
    {'icon': 'images/one_click.png', 'title': 'One Click Responce'},
    {'icon': 'images/email.png', 'title': 'Email Templates'},
    {'icon': 'images/sms.png', 'title': 'SMS Templates'},
  ];

  List<Map> credits = [
    {'icon': 'images/credit.png', 'title': 'My Credits'},
    {'icon': 'images/invoice.png', 'title': 'Invoices and billing details'},
    {'icon': 'images/payment.png', 'title': 'My payment details'},
  ];

  List<Map> intergrations = [
    {'icon': 'images/email.png', 'title': 'Email'},
    {'icon': 'images/browser.png', 'title': 'Browser'},
  ];

  List profile = [
    Profile(),
    ReviewsPage(),
    EliteProPage(),
    BadgePage(),
    AccountDetailsPage()
  ];

  List credits_payment = [
    MyCreditsPage(),
    BillingDetails(),
    PaymentDetailsPage()
  ];

  List communication = [
    OneClickResponcePage(),
    EmailTemplatePage(),
    SMSTemplatePage()
  ];

  List intergration_screen = [EmailNotification(), BrowserNotification()];
  int pageIndex = 0;
  var seletced = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Settings',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.w),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Profile',
                style: myStyle(18.sp, FontWeight.w500, textClr),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                seletced = index;
                                pageIndex = seletced;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => profile[pageIndex]));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1, // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(myProfile[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    myProfile[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, textClr),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: myProfile.length)),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Communication',
                style: myStyle(18.sp, FontWeight.bold, textClr),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                seletced = index;
                                pageIndex = seletced;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      communication[pageIndex],
                                ));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(communications[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    communications[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, textClr),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: communications.length)),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Credits & Payments',
                style: myStyle(18.sp, FontWeight.bold, textClr),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                seletced = index;
                                pageIndex = seletced;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            credits_payment[pageIndex]));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(credits[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    credits[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, textClr),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: credits.length)),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Intergrations',
                style: myStyle(18.sp, FontWeight.bold, textClr),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                seletced = index;
                                pageIndex = seletced;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            intergration_screen[pageIndex]));
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset(intergrations[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    intergrations[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, textClr),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: intergrations.length)),
              SizedBox(
                height: 30.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 108.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Color(0xffDF2929),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/share.png'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Save',
                        style: myStyle(16.sp, FontWeight.w500, scaffoldClr),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return GoogleFonts.roboto(fontSize: size, fontWeight: weight, color: clr);
}
