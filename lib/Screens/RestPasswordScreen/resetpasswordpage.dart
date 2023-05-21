import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/RestPasswordScreen/Controller/rest_controller.dart';

import 'package:homelyknock/widgets/custom_widgets.dart';

import '../../utils/colors.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  final _restPasswordController = Get.put(RestPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Container(
              height: 43.h,
              width: 43.w,
              decoration: BoxDecoration(
                color: scaffoldClr,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: backIconClr,
                  size: 18.sp,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Forgot Password',
              style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF555957)),
            ),
            Text(
              'Create a new password',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF798079)),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 51.h,
            ),
            RichText(
              text: TextSpan(
                  text: "New Password",
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF25302B)),
                  children: [
                    TextSpan(
                        text: "*",
                        style:
                            GoogleFonts.roboto(color: const Color(0xFFDA1414)))
                  ]),
            ),
            SizedBox(
              height: 9.h,
            ),
            Obx(
              () => TextFormField(
                controller: _restPasswordController.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is Empty';
                  } else if (value.length < 8) {
                    return '8 character requried is password';
                  }
                  return null;
                },
                obscureText: !_restPasswordController.isVisibility.value,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  fillColor: const Color(0xFFD9F1E5).withOpacity(0.62),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0)),
                  hintText: "*******",
                  suffixIcon: InkWell(
                      onTap: () {
                        _restPasswordController.isVisibility.value =
                            !_restPasswordController.isVisibility.value;
                      },
                      child: Icon(
                          !_restPasswordController.isVisibility.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black)),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 14.h, minWidth: 45.w),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            RichText(
              text: TextSpan(
                  text: "Confirm Password",
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF25302B)),
                  children: [
                    TextSpan(
                        text: "*",
                        style:
                            GoogleFonts.roboto(color: const Color(0xFFDA1414)))
                  ]),
            ),
            SizedBox(
              height: 9.sp,
            ),
            Obx(
              () => TextFormField(
                controller: _restPasswordController.confirmpasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Field is Empty';
                  } else if (value.length < 8) {
                    return '8 character requried is password';
                  }
                  return null;
                },
                obscureText: !_restPasswordController.isVisiable.value,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  fillColor: const Color(0xFFD9F1E5).withOpacity(0.62),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0.5)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 0)),
                  hintText: "*******",
                  suffixIcon: InkWell(
                      onTap: () {
                        _restPasswordController.isVisiable.value =
                            !_restPasswordController.isVisiable.value;
                      },
                      child: Icon(
                          !_restPasswordController.isVisiable.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black)),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 14.h, minWidth: 45.w),
                ),
              ),
            ),
            SizedBox(
              height: 44.h,
            ),

            InkWell(
              onTap: () {
                _restPasswordController.forgetPassword();
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF187949),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Obx(
                      () => SizedBox(
                        width:
                            _restPasswordController.isLoading.value ? 5.w : 0,
                      ),
                    ),
                    Obx(() {
                      if (_restPasswordController.isLoading.value) {
                        return SizedBox(
                          height: 15.sp,
                          width: 15.sp,
                          child: const CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    })
                  ],
                ),
              ),
            ),

            // customButton(
            //   onTap: () {},
            //   title: 'Save',
            // )
          ],
        ),
      ),
    );
  }
}
