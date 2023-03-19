// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Screens/ResistrationScreen/Controller/registration_controller.dart';
import 'package:myapp/Screens/ResistrationScreen/component/custom_button.dart';
import 'package:myapp/Screens/ResistrationScreen/component/custome_text_field.dart';

import 'package:myapp/Screens/SignInScreen/signinpage.dart';

import '../../utils/colors.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: themeColorGreen,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ),
            title: Text(
              'Registration',
              style: GoogleFonts.roboto(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff555957)),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customeText(title: 'Full Name'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.nameController,
                    hintText: 'Enter your name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Enter your email'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      } else if (value.contains('@') && !value.contains('.')) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Password'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.passwordController,
                    obscureText: _registrationController.isVisibility.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      } else if (value.length < 8) {
                        return '8 character requried is password';
                      }
                      return null;
                    },
                    hintText: '********',
                    suffixIcon: Obx(
                      () => IconButton(
                          onPressed: () {
                            _registrationController.isVisibility.value =
                                !_registrationController.isVisibility.value;
                          },
                          icon: Icon(
                              _registrationController.isVisibility.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Confirm Password'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller:
                        _registrationController.confirmpasswordController,
                    obscureText: _registrationController.isVisibility.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      } else if (value !=
                          _registrationController.passwordController.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                    hintText: '********',
                    suffixIcon: Obx(
                      () => IconButton(
                          onPressed: () {
                            _registrationController.isVisibility.value =
                                !_registrationController.isVisibility.value;
                          },
                          icon: Icon(
                              _registrationController.isVisibility.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Date of birth'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                      onTap: () {
                        _registrationController.selectdDateTime(context);
                      },
                      controller: _registrationController.dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Feild is Empty';
                        }
                        return null;
                      },
                      hintText: '01/01/2000',
                      suffixIcon: Icon(Icons.calendar_today)),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Number'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.numberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Feild is Empty';
                      }
                    },
                    hintText: '+880100000000',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Corporate Name'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.corpunameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Feild is Empty';
                      }
                      return null;
                    },
                    hintText: 'Frelence learning center',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  customeText(title: 'Corporate Number'),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomeTextField(
                    controller: _registrationController.corpunameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Feild is Empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    hintText: '+980000000',
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  CustomButton(
                      title: 'Next',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignInPage()));
                      })
                ],
              ),
            ),
          )),
    );
  }

  Widget customeText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xff555957)),
    );
  }
}

final _registrationController = Get.put(RegistrationController());
