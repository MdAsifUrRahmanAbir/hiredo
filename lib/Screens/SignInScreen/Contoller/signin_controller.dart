import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';
import 'package:homelyknock/common_dashboard_services/controller/api_services.dart';
import 'package:homelyknock/nav_bar_page/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../local/my_local.dart';
import '../../../widgets/data_controller.dart';
import '../Model/login_model.dart';

class SignInController extends GetxController {
  var isChecked = false.obs;
  var isLoading = false.obs;
  var isVisibility = false.obs;

  final _dataController = Get.put(DataController());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  
  late SharedPreferences preferences;

  @override
  onInit() {

    rememberMeGetData();
    super.onInit();
  }

  // handlesSignIn

  userSignIn({required BuildContext context,required bool isLogged,required String email, required String password}) async {
    if(isLogged){
        isLoading(true);
    }
    
    try {
      var result = await ApiServices.handelLogin(
          email: email, password: password);

      if (result.runtimeType == int) {
        if(!isLogged){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SignInPage()));
           }
        Fluttertoast.showToast(msg: "Invalid email or password.",);
        debugPrint("Opps sign in Error $result");
      } else {
        
        LoginModel allData = result;
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
            isUserD: allData.user.isUser);

            debugPrint(_dataController.id.toString());

           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainScreen()), (route) => false);
       
        if(isChecked.value){
        await  rememberMeSetData();
        }
        MyPreference.isLoggedSave(email:emailController.text,password:passwordController.text);
        MyPreference.setToken(allData.token);

         emailController.clear();
        passwordController.clear();

        debugPrint("Sign in Sucessfull");
      }
    } on Exception catch (e) {
      debugPrint("Opps sign in Error $e");
      
      // TODO
    } finally {
      if(isLogged){
        isLoading(false);
    }
    }
  }


  rememberMeSetData()async{
      preferences = await SharedPreferences.getInstance();
    preferences.setString("rememberEmail", emailController.text);
    preferences.setString("rememberPassword", passwordController.text);


  }
rememberMeGetData()async{
 preferences = await SharedPreferences.getInstance();
  String email= preferences.getString("rememberEmail",)??"";
   String password=   preferences.getString("rememberPassword",)??"";
   emailController.text=email;
   passwordController.text=password;

  }


}
