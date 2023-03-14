import 'package:flutter/material.dart';



import 'package:get/get.dart';


import 'package:myapp/Screens/SplashScreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashPage(),

      // routes: {
      //   SplashPage.routeName: (context) => SplashPage(),
      //   IntroOnePage.routename: (context) => IntroOnePage(),
      //   IntroTwoPage.routename: (context) => IntroTwoPage(),
      //   SignInPage.routename: (context) => SignInPage(),
      //   SignIntroPage.routename: (context) => SignIntroPage(),
      //   SignAccountChoosePage.routename: (context) => SignAccountChoosePage(),
      //   RegistrationPage.routename: (context) => RegistrationPage(),
      //   ForegPasswordPage.routename: (context) => ForegPasswordPage(),
      //   VerificationPage.routename: (context) => VerificationPage(),
      //   ResetPasswordPage.routename: (context) => ResetPasswordPage(),
      //   BottomNavController.routename: (context) => BottomNavController(),
      //   Favourite.routename: (context) => Favourite(),
      //   BlankPage.routename: (context) => BlankPage(),
      //   CategoriesPage.routename: (context) => CategoriesPage(),
      //   SearchResult.routename: (context) => SearchResult(),
      //   LocationPage.routename: (context) => LocationPage(),
      //   UpdateLeadSettings.routename: (context) => UpdateLeadSettings(),
      //   Profile.routename: (context) => Profile(),
      //   LeadsScreen.routename: (context) => LeadsScreen(),
      //   SettingsPage.routename: (context) => SettingsPage(),
      //   MyResponse.routename: (context) => MyResponse(),
      //   ReviewsPage.routename: (context) => ReviewsPage()
      // }
    );


  }
}
