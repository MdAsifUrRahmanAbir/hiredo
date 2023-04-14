import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';

import 'package:homelyknock/Screens/ResistrationScreen/component/custome_text_field.dart';
import 'package:homelyknock/Screens/SignInScreen/Contoller/signin_controller.dart';
import 'package:homelyknock/nav_bar_page/main_screen.dart';

import 'package:homelyknock/utils/colors.dart';

import '../ForgetPasswordScreen/forgotpasswordpage.dart';

import '../SignUpAccountScreen/signupaccountchoosepage.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    _signInController.rememberMeGetData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90.r),
                    topRight: Radius.circular(90.r),
                    bottomLeft: Radius.circular(90.r),
                    bottomRight: Radius.circular(90.r)),
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
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: themeColorGreen,
                ),
                onPressed: () {
                  Get.back();
                },
              )),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      'Sign in to your account',
                      style: GoogleFonts.roboto(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF555957)),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  customeText(title: "Email"),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomeTextField(
                    controller: _signInController.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Feild is Empty';
                      } else if (value.contains('@') && !value.contains('.')) {
                        return 'Invalid Your Email';
                      }
                      return null;
                    },
                    hintText: "Email or Phone Number",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  customeText(title: "Password"),
                  SizedBox(
                    height: 6.h,
                  ),
                  Obx(
                    () => TextFormField(
                      controller: _signInController.passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field is Empty';
                        } else if (value.length < 8) {
                          return '8 character requried is password';
                        }
                        return null;
                      },
                      obscureText: !_signInController.isVisibility.value,
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 16.w),
                        fillColor: const Color(0xFFD9F1E5).withOpacity(0.62),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFF187949).withOpacity(0.2),
                                width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFF187949).withOpacity(0.2),
                                width: 0.5)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xFF1879492B).withOpacity(0.2),
                                width: 0)),
                        hintText: "*******",
                        suffixIcon: Obx(
                          () => InkWell(
                              onTap: () {
                                _signInController.isVisibility.value =
                                    !_signInController.isVisibility.value;
                              },
                              child: Icon(
                                  !_signInController.isVisibility.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black)),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minHeight: 14.h, minWidth: 45.w),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

// <------------------- remember me ---------------->

                  Obx(
                    () => InkWell(
                      onTap: () {
                        _signInController.isChecked.value =
                            !_signInController.isChecked.value;
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.w,
                            child: Checkbox(
                              activeColor: themeColorGreen,
                              value: _signInController.isChecked.value,
                              onChanged: (value) {
                                _signInController.isChecked.value =
                                    !_signInController.isChecked.value;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            'Remember me',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff555957)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  // <------------------- remember me ---------------->
                  // InkWell(
                  //   onTap: () {

                  //              Get.to(MainScreen());

                  //     if(_formKey.currentState!.validate()){
                  //         _signInController.userSignIn(context);
                  //     }
                  //     // // login();

                  //     // Get.to(Home());
                  //   },
                  //   child: Container(
                  //     height: 50.h,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //         color: const Color(0xFF187949),
                  //         borderRadius: BorderRadius.circular(4.r)),
                  //     child: Center(
                  //       child: Text(
                  //         'Sign In',
                  //         style: GoogleFonts.roboto(
                  //             color: Colors.white,
                  //             fontSize: 16.sp,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _signInController.userSignIn(
                            isLogged: true,
                            email: _signInController.emailController.text,
                            password:
                                _signInController.passwordController.text);
                      }
                      // Get.to(SignInPage());
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
                            'Sign in',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Obx(
                            () => SizedBox(
                              width:
                                  _signInController.isLoading.value ? 15.w : 0,
                            ),
                          ),
                          Obx(() {
                            if (_signInController.isLoading.value) {
                              return SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
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

                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.forgotpasswordpage);
                        },
                        child: Text(
                          'Forgot the password?',
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp, color: themeColorGreen),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an accout?",
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff555957)),
                      ),
                      InkWell(
                          onTap: () {
                          Get.toNamed(Routes.signInAccountChoosePage);
                          },
                          child: Text(
                            ' Sign Up',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: themeColorGreen),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customeText({required String title}) {
    return RichText(
        text: TextSpan(
            text: title,
            style: GoogleFonts.roboto(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff555957)),
            children: [
          TextSpan(
            text: "*",
            style: GoogleFonts.roboto(
                color: const Color(0xffDA1414),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        ]));
  }
}
