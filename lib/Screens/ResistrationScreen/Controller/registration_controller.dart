import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Screens/ForgetPasswordScreen/forgotpasswordpage.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';
import 'package:myapp/Screens/ResistrationScreen/Model/registration_model.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {
  var isVisibility = false.obs;
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
    phoneController.dispose();
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

  signUp(BuildContext context) async {
    isLoading(true);

    try {
      RegistrationModel registrationModel = RegistrationModel(
          userName: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmpasswordController.text,
          dateOfBirth: dateController.text,
          phoneNumber: phoneController.text,
          corporateName: corpunameController.text,
          corporateNumber: corpunameController.text);

      var result =
          await ApiServices.handelRegistration(model: registrationModel);
      if (result) {
        isLoading(false);
        print(result);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => SignInPage()));
      } else {
        print("Ooops! Sign in error");
        isLoading(false);
      }
    } on Exception catch (e) {
      print("Ooops! Sign in error. ${e.toString()}");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }
}
