import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:myapp/Screens/IntroScreen/onBoarding_screen.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/local/my_local.dart';

import 'package:myapp/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nav_bar_page/main_screen.dart';
import '../../widgets/data_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _dataController =Get.put(DataController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString('token') != null&& preferences.get("isLoggedIn")==true) {
        _dataController.getData();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainScreen()));
      } else {
        bool isOnboard = await MyPreference.getOnBoard();
        print(isOnboard);
        if(isOnboard){
          Get.off(SignIntroPage());
        }else{
          print(isOnboard);
            Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => OnboardinScreen()));
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
        width:  MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
            
              colors:[
                   Color(0xFF174E31),
                 Color(0xFF1A7949),
                 Color(0xFF174E31),
              
                 
               
                
            ]),

        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w
          ),
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
    );
  }
}
