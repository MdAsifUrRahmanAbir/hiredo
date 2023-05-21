import 'dart:core';

import 'package:get/get.dart';
import 'package:homelyknock/Screens/CategoriesScreen/categories.dart';
import 'package:homelyknock/Screens/FeturedService/fetured_service.dart';
import 'package:homelyknock/Screens/ForgetPasswordScreen/forgotpasswordpage.dart';
import 'package:homelyknock/Screens/InboxScreen/chat_screen.dart';
import 'package:homelyknock/Screens/InboxScreen/inbox_screen.dart';
import 'package:homelyknock/Screens/IntroScreen/introonepage.dart';
import 'package:homelyknock/Screens/IntroScreen/onBoarding_screen.dart';
import 'package:homelyknock/Screens/IntroScreen/signupintropage.dart';
import 'package:homelyknock/Screens/JobPost/post_a_job.dart';
import 'package:homelyknock/Screens/LeadsDetailsScreen/leads_details_screen.dart';
import 'package:homelyknock/Screens/LeadsScreen/lead_screen.dart';
import 'package:homelyknock/Screens/LocationScreen/locationpage.dart';
import 'package:homelyknock/Screens/MyResponse/my_response.dart';
import 'package:homelyknock/Screens/OrderScreen/ordername.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';
import 'package:homelyknock/Screens/ReviewScreen/reviews_page.dart';
import 'package:homelyknock/Screens/Service/service.dart';
import 'package:homelyknock/Screens/SettingsScreen/AccountDetails/account_details.dart';
import 'package:homelyknock/Screens/SettingsScreen/BillingDetails/billing_details.dart';
import 'package:homelyknock/Screens/SettingsScreen/BrowserNotification/browser_notification.dart';
import 'package:homelyknock/Screens/SettingsScreen/ChangePassword/change_password_screen.dart';
import 'package:homelyknock/Screens/SettingsScreen/ElitePro/elite_pro_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailNotification/email_notification.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/email_template_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/MyCredits/my_credits_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/OneClickResponce/one_click_responce_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/PaymentDetails/payment_details_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/sms_template_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/SettingsBadge/badge_page.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/Screens/SignUpAccountScreen/signupaccountchoosepage.dart';
import 'package:homelyknock/Screens/SplashScreen/splashscreen.dart';
import 'package:homelyknock/Screens/TrackingScreen/TabsScreen/trackingpost.dart';
import 'package:homelyknock/Screens/WishListScreen/wish_list_screen.dart';
import 'package:homelyknock/nav_bar_page/main_screen.dart';
import '../Screens/CategoriesScreen/subcategory.dart';
import '../Screens/CompletePostDetails/complete_post.dart';
import '../Screens/EmailVerifiyScreen/enterverificationpage.dart';
import '../Screens/HelpScreen/help_screen.dart';
import '../Screens/IntroScreen/introtwopage.dart';
import '../Screens/LocationScreen/add_location.dart';
import '../Screens/MyResponseDetails/my_response_details.dart';
import '../Screens/QuestionScreen/question_screen.dart';
import '../Screens/ResistrationScreen/registrationpage.dart';
import '../Screens/RestPasswordScreen/resetpasswordpage.dart';
import '../Screens/Service/add_service.dart';
import '../Screens/SettingsScreen/SettingsBadge/badges_second_page.dart';

class Routes {
  static String splash = '/splash';
  static String onboard = '/onboard';
  static String introOne = '/intro_one';
  static String introTwo = '/intro_two';
  static String signIntroPage = '/signin_intro_page';
  static String signinPage = '/signin_page';
  static String signInAccountChoosePage = '/sign_in_account_choose_page';
  static String signUpPage = '/sign_up_page';
  static String forgotpasswordpage = "/forgot_password";
  static String mainPage = "/main_page";
  static String forgotVerification = '/forgot_verification';
  static String resetpasswordpage = '/reset_password_page';
  static String postAJob = "/post_a_job";
  static String categoriesPage = '/categories_page';
  static String feturedServiceScreen = '/fetured_service_screen';
  static String subCategoryPage = '/sub_category_screen';
  static String trackingPostPage = '/tracking_post_screen';
  static String orderNamePage = '/order_name_screen';
  static String locationPage = '/location_screen';
  static String servicePage = '/service_screen';
  static String serviceAddPage = '/service_add_screen';
  static String helpPage = '/help_screen';
  static String leadPage = '/lead_screen';
  static String leadDetailsPage = '/lead_details_screen';
  static String questionScreen = '/question_screen';
  static String myResponse = '/my_response';
  static String wishListScreen = '/wish_list_screen';
  static String settingPage = '/setting_page';
  static String changePasswordScreen = '/change_password_screen';
  static String badgeDetails = '/badges_details';
  static String myProfile = '/my_profile';
  static String reviewPage = '/review_screen';
  static String elitProPage = '/elit_pro_screen';
  static String badgePage = '/badge_screen';
  static String accountDetails = '/account_details';
  static String oneClickResponsePage = '/one_click_response_screen';
  static String emailTemplate = '/email_template_screen';
  static String smsTemplate = '/sms_template_screen';
  static String myCredits = '/my_credits_screen';
  static String invoiceAndBilling = '/invoice_and_billing_screen';
  static String myPaymentDetails = '/my_payment_details_screen';
  static String emailNotification = '/email_notification_screen';
  static String browserNotification = '/browser_notification_screen';
  static String completePostDetails = "/complete_post_delete";
  static String myresponseDetailsScreen = "/myresponse_details_screen";
  static String addLocationScreen = "/add_location_screen";
  static String inboxScreen = "/inbox_screen";
  static String chatScreen = "/chat_screen";
}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashPage(),
  ),
  GetPage(
    name: Routes.onboard,
    page: () => const OnboardinScreen(),
  ),
  GetPage(
    name: Routes.introOne,
    page: () => const IntroOnePage(),
  ),
  GetPage(
    name: Routes.introTwo,
    page: () => const IntroTwoPage(),
  ),
  GetPage(
    name: Routes.signIntroPage,
    page: () => const SignIntroPage(),
  ),
  GetPage(
    name: Routes.signinPage,
    page: () => SignInPage(),
  ),
  GetPage(
    name: Routes.signInAccountChoosePage,
    page: () => const SignAccountChoosePage(),
  ),
  GetPage(
    name: Routes.signUpPage,
    page: () => RegistrationPage(),
  ),
  GetPage(
    name: Routes.forgotpasswordpage,
    page: () => ForegPasswordPage(),
  ),
  GetPage(
    name: Routes.mainPage,
    page: () => MainScreen(),
  ),
  GetPage(name: Routes.forgotVerification, page: () => VerificationPage()),
  GetPage(name: Routes.resetpasswordpage, page: () => ResetPasswordPage()),

  GetPage(name: Routes.postAJob, page: () => PostAJob()),
  GetPage(name: Routes.categoriesPage, page: () => CategoriesPage()),
  GetPage(
      name: Routes.feturedServiceScreen, page: () => FeturedServiceScreen()),
  GetPage(name: Routes.subCategoryPage, page: () => SubCategoryPage()),
  GetPage(name: Routes.trackingPostPage, page: () => TrackingPostOrder()),
  GetPage(name: Routes.orderNamePage, page: () => const OrderName()),
  GetPage(name: Routes.locationPage, page: () => LocationPage()),
  GetPage(name: Routes.servicePage, page: () => ServiceScreen()),
  GetPage(name: Routes.serviceAddPage, page: () => ServiceAdd()),
  GetPage(name: Routes.leadPage, page: () => LeadsScreen()),
  GetPage(name: Routes.leadDetailsPage, page: () => LeadsDetailsScreen()),
  GetPage(name: Routes.questionScreen, page: () => QuestionScreen()),
  GetPage(name: Routes.myResponse, page: () => MyResponse()),
  GetPage(name: Routes.wishListScreen, page: () => const WishListScreen()),
  GetPage(name: Routes.settingPage, page: () => const SettingsPage()),
  GetPage(
      name: Routes.changePasswordScreen, page: () => ChangePasswordScreen()),
  GetPage(name: Routes.badgeDetails, page: () => BadgesSecondPage()),
  GetPage(name: Routes.helpPage, page: () => HelpScreen()),
  GetPage(name: Routes.myProfile, page: () => Profile()),
  GetPage(name: Routes.reviewPage, page: () => ReviewsPage()),
  GetPage(name: Routes.elitProPage, page: () => const EliteProPage()),
  GetPage(name: Routes.badgePage, page: () => BadgePage()),
  GetPage(name: Routes.accountDetails, page: () => AccountDetailsPage()),
  GetPage(
      name: Routes.oneClickResponsePage, page: () => OneClickResponcePage()),
  GetPage(name: Routes.emailTemplate, page: () => EmailTemplatePage()),
  GetPage(name: Routes.smsTemplate, page: () => SMSTemplatePage()),
  GetPage(name: Routes.myCredits, page: () => MyCreditsPage()),
  GetPage(name: Routes.invoiceAndBilling, page: () => BillingDetails()),
  GetPage(name: Routes.myPaymentDetails, page: () => PaymentDetailsPage()),
  GetPage(name: Routes.emailNotification, page: () => EmailNotification()),
  GetPage(name: Routes.browserNotification, page: () => BrowserNotification()),

  //  GetPage(name: Routes.postAJob, page: () => PostAJob()),
  //  GetPage(name: Routes.categoriesPage, page:()=>CategoriesPage()),
  //  GetPage(name: Routes.feturedServiceScreen, page:()=>FeturedServiceScreen()),
  //  GetPage(name: Routes.subCategoryPage, page: ()=> SubCategoryPage()),
  //  GetPage(name: Routes.trackingPostPage, page:()=> TrackingPostOrder()),
  //  GetPage(name: Routes.orderNamePage, page: ()=>const OrderName()),
  //  GetPage(name: Routes.locationPage, page: ()=> LocationPage()),
  //  GetPage(name: Routes.servicePage, page: ()=> ServiceScreen()),
  //  GetPage(name: Routes.serviceAddPage, page: ()=> ServiceAdd()),
  //  GetPage(name: Routes.leadPage, page:()=> LeadsScreen()),
  //  GetPage(name: Routes.leadDetailsPage, page:()=>LeadsDetailsScreen()),
  //  GetPage(name: Routes.questionScreen, page: ()=>QuestionScreen()),
  //   GetPage(name: Routes.myResponse, page: ()=>MyResponse()),
  //   GetPage(name: Routes.wishListScreen, page:()=> WishListScreen()),
  //   GetPage(name: Routes.settingPage, page:()=>SettingsPage()),
  //   GetPage(name: Routes.changePasswordScreen, page:()=>ChangePasswordScreen()),
  //   GetPage(name: Routes.badgeDetails, page:()=>BadgesSecondPage() ),
  //   GetPage(name: Routes.helpPage, page:()=> HelpScreen() ),

  GetPage(name: Routes.completePostDetails, page: () => CompletePostDetails()),
  GetPage(
      name: Routes.myresponseDetailsScreen,
      page: () => MyresponseDetailsScreen()),

  GetPage(name: Routes.addLocationScreen, page: () => AddLoaction()),
  GetPage(name: Routes.inboxScreen, page: () =>  InboxScreen()),
  GetPage(name: Routes.chatScreen, page: () => ChatScreen())
];
