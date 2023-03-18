// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/IntroScreen/introtwopage.dart';
import 'package:myapp/utils/colors.dart';

class IntroOnePage extends StatefulWidget {
  static const String routename = '/introonepage';
  const IntroOnePage({Key? key}) : super(key: key);

  @override
  State<IntroOnePage> createState() => _IntroOnePageState();
}

class _IntroOnePageState extends State<IntroOnePage> {
  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Image.asset('images/img1.png'),
              Padding(
                padding: EdgeInsets.all(38.0.w),
                child: Column(
                  children: [
                    Text(
                      'Easy to your on demand service',
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Ringknock is an online on demand service.'
                      'It has as into 50k+ services. You can buy every onto a service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff555957)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.chevron_left,
                        color: themeColorGreen, size: 25.sp),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: themeColorGreen,
                          size: 12.sp,
                        ),
                        Icon(Icons.circle, color: Colors.grey, size: 12.sp),
                        Icon(Icons.circle, color: Colors.grey, size: 12.sp)
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => IntroTwoPage()));
                      },
                      icon: Icon(Icons.chevron_right_outlined,
                          color: themeColorGreen, size: 25.sp),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
