
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyknock/utils/colors.dart';

class CustomTextFieldForm extends StatelessWidget {

 const CustomTextFieldForm({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIconButton,
    this.readOnly=false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final IconButton? suffixIconButton;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
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



