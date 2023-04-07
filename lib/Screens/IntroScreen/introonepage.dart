// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/Screens/IntroScreen/introtwopage.dart';
import 'package:homelyknock/utils/colors.dart';

class IntroOnePage extends StatefulWidget {
  const IntroOnePage({Key? key}) : super(key: key);

  @override
  State<IntroOnePage> createState() => _IntroOnePageState();
}

class _IntroOnePageState extends State<IntroOnePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Image.asset('images/img1.png'),
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Text(
              'Easy to your on demand service',
              style: GoogleFonts.roboto(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF555957)),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Text(
              "Ringknock is a online on demand  service. It’s has as into the 50k+ services. you can buy every onto a services.",
              style: GoogleFonts.roboto(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF555957)),
            ),
          )
        ],
      )),
    );
  }
}
