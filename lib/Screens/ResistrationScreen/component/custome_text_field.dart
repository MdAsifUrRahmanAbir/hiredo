import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomeTextField extends StatelessWidget {
  CustomeTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.onTap,
      this.keyboardType,
      this.maxLines,
      this.readOnly,
      this.validator});

  TextEditingController? controller;
  String? hintText;
  Widget? suffixIcon;
  int? maxLines;
  String? Function(String?)? validator;
  bool obscureText;
  Function()? onTap;
  TextInputType? keyboardType;
  bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly??false,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        fillColor: const Color(0xFFD9F1E5).withOpacity(0.62),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0xFF187949).withOpacity(0.2), width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0xFF187949).withOpacity(0.2), width: 0.5)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: const Color(0xff187949).withOpacity(0.2), width: 0)),
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(minHeight: 14.h, minWidth: 45.w),
      ),
    );
  }
}
