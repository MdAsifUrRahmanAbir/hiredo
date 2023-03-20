import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var isChecked = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
