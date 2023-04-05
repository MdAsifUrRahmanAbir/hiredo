import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isVisibility = false.obs;
  var isVisible = false.obs;
  var isVisiblele = false.obs;
}