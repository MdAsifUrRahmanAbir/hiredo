
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

class CustomTextFieldForm extends StatelessWidget {

  CustomTextFieldForm({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIconButton
  });

  TextEditingController? controller;
  String? hintText;
  IconButton? suffixIconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: themeColorGreen.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: BorderSide(
              color: themeColorGreen.withOpacity(0.3),
              width: .2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: BorderSide(
              color: themeColorGreen.withOpacity(0.3),
              width: .2.w,
            ),
          ),
          suffixIcon: suffixIconButton,
          hintText: hintText),
    );
  }
}



class customButton extends StatelessWidget {
   customButton({
    super.key,
    this.onTap,
     this.title
  });

  void Function()? onTap;
  String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: backIconClr
        ),
        child: Text(
          title!,
          style: myStyle(18.sp, FontWeight.w500, scaffoldClr),
        ),
      ),
    );
  }
}

