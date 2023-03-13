import 'package:get/get.dart';
import 'package:myapp/Screens/BalanceScreen/blancpage.dart';
import 'package:myapp/Screens/CategoriesScreen/categories.dart';
import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';
import 'package:myapp/Screens/FavoriteScreen/favourite.dart';
import 'package:myapp/Screens/ForgetPasswordScreen/forgotpasswordpage.dart';
import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/Screens/IntroScreen/introtwopage.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/Screens/LeadsScreen/lead_screen.dart';
import 'package:myapp/Screens/LocationScreen/locationpage.dart';
import 'package:myapp/Screens/MyResponse/my_response.dart';
import 'package:myapp/Screens/ProfileScreen/profile.dart';
import 'package:myapp/Screens/ResistrationScreen/registrationpage.dart';
import 'package:myapp/Screens/RestPasswordScreen/resetpasswordpage.dart';
import 'package:myapp/Screens/ReviewScreen/reviews_page.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/SignUpAccountScreen/signupaccountchoosepage.dart';
import 'package:myapp/Screens/SplashScreen/splashscreen.dart';
import 'package:myapp/Screens/UpdateLeadSetting/update_lead_settings.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';

const String splash = '/splash-screen';
const String introPageOne = '/intro-one-screen';
const String introPageTwo = '/intro-two-screen';
const String signin = '/signin-screen';
const String signinintropage = '/signin-intro-screen';
const String signinaccout = '/signin-account-screen';
const String registration = '/registration-screen';
const String forget = '/forget-screen';
const String verification = '/verification-screen';
const String resetpassword = '/resetpassword-screen';
const String bottomnav = '/bottomnav-screen';
const String favorite = '/favorite-screen';
const String blankpage = '/blank-screen';
const String categories = '/categories-screen';
const String serachresult = '/searchresult-screen';
const String location = '/location-screen';
const String updateleadsettings = '/updateleadsetting-screen';
const String profile = '/profile-screen';
const String leadscreen = '/leads-screen';
const String settings = '/settings-screen';
const String myresponse = '/myresponse-screen';
const String reviews = '/reviews-screen';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashPage()),
  GetPage(name: introPageOne, page: () => IntroOnePage()),
  GetPage(name: introPageTwo, page: () => IntroTwoPage()),
  GetPage(name: signin, page: () => SignInPage()),
  GetPage(name: signinintropage, page: () => SignIntroPage()),
  GetPage(name: signinaccout, page: () => SignAccountChoosePage()),
  GetPage(name: registration, page: () => RegistrationPage()),
  GetPage(name: forget, page: () => ForegPasswordPage()),
  GetPage(name: verification, page: () => VerificationPage()),
  GetPage(name: resetpassword, page: () => ResetPasswordPage()),
  GetPage(name: bottomnav, page: () => BottomNavController()),
  GetPage(name: favorite, page: () => Favourite()),
  GetPage(name: blankpage, page: () => BlankPage()),
  GetPage(name: categories, page: () => CategoriesPage()),
  GetPage(name: serachresult, page: () => SearchResult()),
  GetPage(name: location, page: () => LocationPage()),
  GetPage(name: updateleadsettings, page: () => UpdateLeadSettings()),
  GetPage(name: profile, page: () => Profile()),
  GetPage(name: leadscreen, page: () => LeadsScreen()),
  GetPage(name: settings, page: () => SettingsPage()),
  GetPage(name: myresponse, page: () => MyResponse()),
  GetPage(name: reviews, page: () => ReviewsPage())
];
