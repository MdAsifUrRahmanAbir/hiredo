// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';

import '../../Route/routes.dart';
import '../SignUpAccountScreen/signupaccountchoosepage.dart';
import '../../utils/colors.dart';

class SignIntroPage extends StatefulWidget {
  static const String routename = '/signupintropage';
  const SignIntroPage({Key? key}) : super(key: key);

  @override
  State<SignIntroPage> createState() => _SignIntroPageState();
}

class _SignIntroPageState extends State<SignIntroPage> {
  @override
  Widget build(BuildContext context) {
    // double sch = MediaQuery.of(context).size.height;
    // double scw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 28.h,),
        Image.asset('images/ima3.png',height: 383.h,width: double.infinity,fit: BoxFit.fill,),
        SizedBox(
          height: 68.h,
        ),
        Text(
          'Choose Your Service',
          style: GoogleFonts.roboto(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF424242)),
        ),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40.w, right: 30.w),
          child: Text(
            'Ringknock is a online on demand  service. It’s has as into the 50k+ services.',
            style: GoogleFonts.roboto(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xFF424242)),
          ),
        ),
        SizedBox(
          height: 68.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: InkWell(
            onTap: () {
               Get.toNamed(Routes.signInAccountChoosePage);
            
            },
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF187949),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Center(
                child: Text(
                  'Create Profile',
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have a profile?',
              style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF555957)),
            ),
            
            InkWell(
              onTap: () {
                Get.toNamed(Routes.signinPage);
               
              },
              child: Text(
                ' Sign in',
                style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF187949)),
              ),
            )
          ],
        )
          ],
        ),
      ),
    );
  }
}
