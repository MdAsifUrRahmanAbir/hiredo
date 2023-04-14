import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:intl/intl.dart';

import 'package:homelyknock/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:homelyknock/Screens/SignInScreen/signinpage.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/api_services.dart';

class RegistrationController extends GetxController {
  var isVisibility = false.obs;

var isVisible = false.obs;

  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final nameController = TextEditingController();

  final numberController = TextEditingController();
  final corpunameController = TextEditingController();
  final corpunumController = TextEditingController();

  var isLoading = false.obs;

  late SharedPreferences pref;

  var seleteDate = DateTime.now().obs;

  void textFieldClear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmpasswordController.clear();
    nameController.clear();
    numberController.clear();
    corpunameController.clear();
    corpunumController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    dateController.dispose();

    corpunameController.dispose();
    corpunameController.dispose();
    super.dispose();
  }

  void selectdDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: seleteDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
    }
  }

  signUp(BuildContext context, String userType) async {
    isLoading(true);

    try {
      SignUpModel signUpModel = SignUpModel(
        fullName: nameController.text, 
        email: emailController.text,
       dateOfBirth: dateController.text, 
       phoneNumber: numberController.text, 
       corporationName: corpunameController.text, 
       corporationNumber: corpunumController.text,
        isUser: userType == 'User' ? true: false,
         isProfessional: userType == 'Professional' ? true: false,
          password: passwordController.text);
   

      var result =
           await ApiServices.handelRegistration(model: signUpModel);
      if (result) {
        isLoading(false);
        debugPrint("$result");

        print('User create successful');

        Get.toNamed(Routes.signinPage);
        textFieldClear();

    

      } else {
        debugPrint(" Sign in error");
        isLoading(false);
      }
    } on Exception catch (e) {
      debugPrint("Ooops! Sign in error. ${e.toString()}");
      isLoading(false);  
    } finally {
      isLoading(false);
    }
  }
}
