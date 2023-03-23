import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.onTap,
      this.keyboardType,
      this.validator});

  TextEditingController? controller;
  String? hintText;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  bool obscureText;
  Function()? onTap;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.only(top: 10.h, left: 10.w),
        fillColor: themeColorGreen.withOpacity(0.1),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0.5)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 0)),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
