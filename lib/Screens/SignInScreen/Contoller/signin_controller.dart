import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';



import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/api_services.dart';
import '../../../local/my_local.dart';
import '../../../nav_bar_page/main_controller.dart';
import '../../../widgets/data_controller.dart';
import '../Model/login_model.dart';

class SignInController extends GetxController {
  var isChecked = false.obs;
  var isLoading = false.obs;
  var isVisibility = false.obs;

  final _dataController = Get.put(DataController());
  final _mainController = Get.put(MainScreenController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences preferences;

  @override
  onInit() {
    rememberMeGetData();
    super.onInit();
  }

  // handlesSignIn

  userSignIn(
      {required bool isLogged,
      required String email,
      required String password}) async {
    if (isLogged) {
      isLoading(true);
    }

    try {
      var result =
          await ApiServices.handelLogin(email: email, password: password);

      if (result.runtimeType == int) {
        if (!isLogged) {
          _mainController.initIndex.value = 0;
          Get.offAllNamed(Routes.signinPage);
            _dataController.getData();
        } else {
          Fluttertoast.showToast(
            msg: "Invalid email or password.",
          );
        }

        debugPrint("Opps sign in Error $result");
      } else {
        LoginModel allData = result;
        
     
           if (isChecked.value) {
          await rememberMeSetData();
        }
       await MyPreference.isLoggedSave(
            email: emailController.text, password: passwordController.text);
         
       await MyPreference.setToken(allData.token);
        

        debugPrint(_dataController.id.toString());
        _mainController.initIndex.value = 0;
        Get.offAllNamed(Routes.mainPage);
           _dataController.setData(
          idD: allData.user.id,
          corporationNameD: allData.user.corporationName,
          corporationNumberD: allData.user.corporationNumber,
          fullNameD: allData.user.fullName,
          dateOfBirthD: allData.user.dateOfBirth,
          emailD: allData.user.email,
          passwordD: allData.user.password,
          phoneD: allData.user.phoneNumber,
          isProfessionalD: allData.user.isProfessional,
          isUserD: allData.user.isUser,
          bearerTokenD: allData.token,
           profileImageD:allData.user.userProfilePic==null?"":allData.user.userProfilePic!.picture,
          stripeCustomerIdD: allData.user.stripeCustomerId,
        );

        if (isChecked.value) {
          await rememberMeSetData();
        }
       await MyPreference.isLoggedSave(
            email: emailController.text, password: passwordController.text);
          debugPrint(allData.token);
       await MyPreference.setToken(allData.token);
         var accessToken = await MyPreference.getToken();
          debugPrint("last token $accessToken");

        emailController.clear();
        passwordController.clear();

        debugPrint("Sign in Sucessfull");
      }
    } on Exception catch (e) {
      debugPrint("Opps sign in Error $e");
    } finally {
      if (isLogged) {
        isLoading(false);
      }
    }
  }

  rememberMeSetData() async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString("rememberEmail", emailController.text);
    preferences.setString("rememberPassword", passwordController.text);
  }

  rememberMeGetData() async {
    preferences = await SharedPreferences.getInstance();
    String email = preferences.getString(
          "rememberEmail",
        ) ??
        "";
    String password = preferences.getString(
          "rememberPassword",
        ) ??
        "";
    emailController.text = email;
    passwordController.text = password;
  }
}
