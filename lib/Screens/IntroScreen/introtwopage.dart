import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/IntroScreen/signupintropage.dart';

import '../../utils/colors.dart';

class IntroTwoPage extends StatefulWidget {
  const IntroTwoPage({Key? key}) : super(key: key);

  @override
  State<IntroTwoPage> createState() => _IntroTwoPageState();
}

class _IntroTwoPageState extends State<IntroTwoPage> {
  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Image.asset('images/img2.png'),
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Text(
              'Easy Payment',
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
