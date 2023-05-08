import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
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

class SettingsPage extends StatelessWidget {
  static const String routename = '/settings';

  SettingsPage({Key? key}) : super(key: key);

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
              _headerText('My Profile'),
              SizedBox(
                height: 10.h,
              ),
              // <------------ My Profile ------->
              _profileCard(
                  title: 'My Profile', icon: 'images/user.png', onTap: () {
                    Get.toNamed(Routes.myProfile);
                  }),
              _profileCard(
                  title: 'Reviews', icon: 'images/reviews.png', onTap: () {
                    Get.toNamed(Routes.reviewPage);
                  }),

              _profileCard(
                  title: 'Elite Pro',
                  icon: 'images/elite_pro.png',
                  onTap: () {
                    Get.toNamed(Routes.elitProPage);
                  }),
              _profileCard(
                  title: 'Badges', icon: 'images/badge.png', onTap: () {
                    Get.toNamed(Routes.badgePage);
                  }),
              _profileCard(
                  title: 'Account Details',
                  icon: 'images/account_details.png',
                  onTap: () {
                    Get.toNamed(Routes.accountDetails);
                  }),

              SizedBox(
                height: 30.h,
              ),
              _headerText('Communication'),

              SizedBox(
                height: 10.h,
              ),
              // ------> Communication --------->
              _profileCard(
                  title: 'One Click Responce',
                  icon: 'images/one_click.png',
                  onTap: () {
                    Get.toNamed(Routes.oneClickResponsePage);
                  }),
              _profileCard(
                  title: 'Email Templates',
                  icon: 'images/email.png',
                  onTap: () {
                       Get.toNamed(Routes.emailTemplate);
                  }),

              _profileCard(
                  title: 'SMS Templates', icon: 'images/sms.png',
                   onTap: () {
                      Get.toNamed(Routes.smsTemplate);
                   }),

              SizedBox(
                height: 30.h,
              ),
              _headerText('Credits & Payments'),
              SizedBox(
                height: 10.h,
              ),

              // -------> Credits & Payment <----------
              _profileCard(
                  title: 'My Credits', icon: 'images/credit.png', onTap: () {
                    Get.toNamed(Routes.myCredits);
                  }),
              _profileCard(
                  title: 'Invoices and billing details',
                  icon: 'images/invoice.png',
                  onTap: () {
                    Get.toNamed(Routes.invoiceAndBilling);
                  }),

              _profileCard(
                  title: 'My payment details',
                  icon: 'images/payment.png',
                  onTap: () {
                    Get.toNamed(Routes.myPaymentDetails,arguments: null);
                  }),

              SizedBox(
                height: 30.h,
              ),

              _headerText('Intergrations'),
              SizedBox(
                height: 10.h,
              ),
              // --------> Intergration <--------

              _profileCard(
                  title: 'Email', icon: 'images/email.png', onTap: () {
                    Get.toNamed(Routes.emailNotification);
                  }),
              _profileCard(
                  title: 'Browser', icon: 'images/browser.png', onTap: () {
                     Get.toNamed(Routes.browserNotification);
                  }),

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

  _profileCard(
      {required String title,
      required String icon,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
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
            Image.asset(icon),
            SizedBox(
              width: 15.w,
            ),
            Text(
              title,
              style: myStyle(16.sp, FontWeight.w500, textClr),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 14.sp,
            )
          ],
        ),
      ),
    );
  }

  Text _headerText(String text) {
    return Text(
      text,
      style: myStyle(18.sp, FontWeight.bold, textClr),
    );
  }
}

myStyle(double size, FontWeight weight, Color clr) {
  return GoogleFonts.roboto(fontSize: size, fontWeight: weight, color: clr);
}
