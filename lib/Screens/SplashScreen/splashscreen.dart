import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/Screens/IntroScreen/onBoarding_screen.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';
import 'package:myapp/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString('token') != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => BottomNavController()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => OnboardinScreen()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: themeColorGreen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to ',
                    style: GoogleFonts.roboto(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  ),
                  Text(
                    'Homely Knocks ',
                    style: GoogleFonts.museoModerno(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF)),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
