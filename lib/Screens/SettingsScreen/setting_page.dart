import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/ProfileScreen/profile.dart';
import 'package:myapp/Screens/ReviewScreen/reviews_page.dart';
import 'package:myapp/Screens/SettingsScreen/AccountDetails/account_details.dart';
import 'package:myapp/Screens/SettingsScreen/BillingDetails/billing_details.dart';
import 'package:myapp/Screens/SettingsScreen/BrowserNotification/browser_notification.dart';
import 'package:myapp/Screens/SettingsScreen/ElitePro/elite_pro_page.dart';
import 'package:myapp/Screens/SettingsScreen/EmailNotification/email_notification.dart';
import 'package:myapp/Screens/SettingsScreen/EmailTemplate/email_template_page.dart';
import 'package:myapp/Screens/SettingsScreen/MyCredits/my_credits_page.dart';
import 'package:myapp/Screens/SettingsScreen/OneClickResponce/one_click_responce_page.dart';
import 'package:myapp/Screens/SettingsScreen/PaymentDetails/payment_details.dart';
import 'package:myapp/Screens/SettingsScreen/SMSTemplate/sms_template_page.dart';
import 'package:myapp/Screens/SettingsScreen/SettingsBadge/badge_page.dart';

class SettingsPage extends StatefulWidget {
  static const String routename = '/settings';

  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Map> myProfile = [
    {'icon': Icons.person_outline, 'title': 'My Profile'},
    {'icon': Icons.reviews_outlined, 'title': 'Reviews'},
    {'icon': Icons.badge, 'title': 'Elite pro'},
    {'icon': Icons.baby_changing_station, 'title': 'Badges'},
    {'icon': Icons.details, 'title': 'Account Details'},
  ];

  List<Map> communications = [
    {'icon': Icons.ads_click, 'title': 'One Click Responce'},
    {'icon': Icons.email, 'title': 'Email Templates'},
    {'icon': Icons.sms, 'title': 'SMS Templates'},
  ];

  List<Map> credits = [
    {'icon': Icons.credit_score, 'title': 'My Credits'},
    {
      'icon': Icons.directions_boat_filled_outlined,
      'title': 'Invoices and billing details'
    },
    {'icon': Icons.payment, 'title': 'My payment details'},
  ];

  List<Map> intergrations = [
    {'icon': Icons.email, 'title': 'Email'},
    {'icon': Icons.open_in_browser, 'title': 'Browser'},
  ];

  List profile = [
    Profile(),
    ReviewsPage(),
    EliteProPage(),
    BadgePage(),
    AccountDetailsPage()
  ];

  List credits_payment = [MyCreditsPage(), BillingDetails(), PaymentDetails()];

  List intergration_screen = [EmailNotification(), BrowserNotification()];

  List communication = [
    OneClickResponcePage(),
    EmailTemplatePage(),
    SMSTemplatePage()
  ];
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
              color: Color(0xff187949),
            )),
        title: Text(
          'Settings',
          style: myStyle(20.sp, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
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
                style: myStyle(18.sp, FontWeight.bold, Colors.black),
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
                                    blurRadius: 1,
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(myProfile[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    myProfile[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
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
                style: myStyle(18.sp, FontWeight.bold, Colors.black),
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
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(communications[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    communications[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
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
                style: myStyle(18.sp, FontWeight.bold, Colors.black),
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
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(credits[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    credits[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
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
                style: myStyle(18.sp, FontWeight.bold, Colors.black),
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
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(intergrations[index]['icon']),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text(
                                    intergrations[index]['title'],
                                    style: myStyle(
                                        16.sp, FontWeight.w500, Colors.black),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16.sp,
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
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                  label: Text('Save'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffDF2929)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return TextStyle(fontSize: size, fontWeight: weight, color: clr);
}
