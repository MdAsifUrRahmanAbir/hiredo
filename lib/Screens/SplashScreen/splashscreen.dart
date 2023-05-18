import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';

import 'package:homelyknock/local/my_local.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../SignInScreen/Contoller/signin_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _signInController = Get.put(SignInController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String isLoggedEmail =
          preferences.getString(Constance.isLoggedEmail) ?? "";
      String isLoggedPassword =
          preferences.getString(Constance.isLoggedPassword) ?? "";
      bool isOnBoard = preferences.getBool(Constance.isOnboard) ?? false;

      if (isLoggedEmail.isNotEmpty) {
        _signInController.userSignIn(
            isLogged: false, email: isLoggedEmail, password: isLoggedPassword);
      } else {
        if (isOnBoard) {
          Get.offAllNamed(Routes.signIntroPage);
        } else {
          debugPrint("navigate on board screen $isOnBoard");

          Get.offAllNamed(Routes.onboard);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              colors: [
                Color(0xFF174E31),
                Color(0xFF1A7949),
                Color(0xFF174E31),
              ]),
        ),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //decoration: BoxDecoration(color: themeColorGreen),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to ',
                  style: GoogleFonts.roboto(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFFFFFFF)),
                ),
                Text(
                  'HireDo',
                  style: GoogleFonts.museoModerno(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFFFFFF)),
                )
              ],
            )),
      ),
    );
  }
}
