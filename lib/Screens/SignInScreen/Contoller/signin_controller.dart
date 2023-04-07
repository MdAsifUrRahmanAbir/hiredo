import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Services/api_services.dart';
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

  userSignIn(BuildContext context) async {
    isLoading(true);
    try {
      var result = await ApiServices.handelLogin(
          email: emailController.text, password: passwordController.text);

      if (result.runtimeType == int) {
        debugPrint("Opps sign in Error $result");
      } else {
        
        LoginModel allData = result;
        _dataController.setData(
            idD: allData.data.id,
            corporationNameD: allData.data.corporationName,
            corporationNumberD: allData.data.corporationNumber,
            fullNameD: allData.data.fullName,
            dateOfBirthD: allData.data.dateOfBirth,
            emailD: allData.data.email,
            passwordD: allData.data.password,
            phoneD: allData.data.phoneNumber,
            isProfessionalD: allData.data.isProfessional,
            isUserD: allData.data.isUser);

            print(_dataController.id);

           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainScreen()), (route) => false);
       
        if(isChecked.value){
        await  rememberMeSetData();
        }
        MyPreference.isLoggedSave(true);
        MyPreference.setToken(allData.token);

         emailController.clear();
        passwordController.clear();

        debugPrint("Sign in Sucessfull");
      }
    } on Exception catch (e) {
      debugPrint("Opps sign in Error $e");
      // TODO
    } finally {
      isLoading(false);
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
