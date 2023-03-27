import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';
import 'package:myapp/Screens/SignInScreen/Model/sign_in_model.dart';
import 'package:myapp/Services/api_services.dart';
import 'package:myapp/local/my_local.dart';

class SignInController extends GetxController {
  var isChecked = false.obs;
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late SignInModel signInModel;

  @override
  onInit() {
    super.onInit();
  }

  // handlesSignIn
  handelSignIn(BuildContext context) async {
    isLoading(true);
    try {
      var result = await ApiServices.handelLogin(
          email: emailController.text, password: passwordController.text);

      if (result.runtimeType == int) {
        isLoading(false);
        if (kDebugMode) {
          print("Login error => Error code $result");
        }
      } else {
        print("Login error");
        MyPreference.setToken(signInModel.token.toString());
        print(signInModel.token);
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    } on Exception catch (e) {
      isLoading(false);
      if (kDebugMode) {
        print("Login error => ${e.toString()}");
      }
    } finally {
      isLoading(false);
    }
  }
}
