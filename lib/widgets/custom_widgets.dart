
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

class CustomTextFieldForm extends StatelessWidget {
  CustomTextFieldForm({
    super.key,
    this.controller,
    this.hintText
  });

  TextEditingController? controller;
  String? hintText;

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
          hintText: hintText),
    );
  }
}
