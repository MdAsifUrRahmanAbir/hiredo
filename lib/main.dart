import 'package:flutter/material.dart';
import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';
import 'package:myapp/Screens/ForgetPasswordScreen/forgotpasswordpage.dart';
import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/Screens/IntroScreen/introtwopage.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/Screens/LeadsScreen/lead_screen.dart';
import 'package:myapp/Screens/MyResponse/my_response.dart';
import 'package:myapp/Screens/ResistrationScreen/registrationpage.dart';
import 'package:myapp/Screens/RestPasswordScreen/resetpasswordpage.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/SignUpAccountScreen/signupaccountchoosepage.dart';
import 'package:myapp/Screens/SplashScreen/splashscreen.dart';
import 'package:myapp/Screens/BalanceScreen/blancpage.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';

import 'Screens/ProfileScreen/profile.dart';
import 'Screens/CategoriesScreen/categories.dart';
import 'Screens/ReviewScreen/reviews_page.dart';
import 'Screens/SearchResultScreen/catsearchpage.dart';
import 'Screens/FavoriteScreen/favourite.dart';
import 'Screens/LocationScreen/locationpage.dart';
import 'Screens/UpdateLeadSetting/update_lead_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashPage(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => SplashPage(),
          IntroOnePage.routename: (context) => IntroOnePage(),
          IntroTwoPage.routename: (context) => IntroTwoPage(),
          SignInPage.routename: (context) => SignInPage(),
          SignIntroPage.routename: (context) => SignIntroPage(),
          SignAccountChoosePage.routename: (context) => SignAccountChoosePage(),
          RegistrationPage.routename: (context) => RegistrationPage(),
          ForegPasswordPage.routename: (context) => ForegPasswordPage(),
          VerificationPage.routename: (context) => VerificationPage(),
          ResetPasswordPage.routename: (context) => ResetPasswordPage(),
          BottomNavController.routename: (context) => BottomNavController(),
          Favourite.routename: (context) => Favourite(),
          BlankPage.routename: (context) => BlankPage(),
          CategoriesPage.routename: (context) => CategoriesPage(),
          SearchResult.routename: (context) => SearchResult(),
          LocationPage.routename: (context) => LocationPage(),
          UpdateLeadSettings.routename: (context) => UpdateLeadSettings(),
          Profile.routename: (context) => Profile(),
          LeadsScreen.routename: (context) => LeadsScreen(),
          SettingsPage.routename: (context) => SettingsPage(),
          MyResponse.routename: (context) => MyResponse(),
          ReviewsPage.routename: (context) => ReviewsPage()
        });
  }
}
