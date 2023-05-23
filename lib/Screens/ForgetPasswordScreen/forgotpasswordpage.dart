// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/Screens/ForgetPasswordScreen/Controller/forget_controller.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../utils/colors.dart';
import '../../widgets/common_data.dart';
import '../ResistrationScreen/component/custome_text_field.dart';

class ForegPasswordPage extends StatelessWidget {
  ForegPasswordPage({Key? key}) : super(key: key);

  final _forgetController = Get.put(ForgetController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        backgroundColor: scaffoldClr,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
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
                    offset: Offset(0, 2), // changes position of shadow
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
        title: Text(
          'Forgot Password?',
          style: myStyle(20, FontWeight.w500, textClr),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 52.h,
              ),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        activeColor: backIconClr,
                        title: Text('Phone'),
                        value: 'phone',
                        groupValue: _forgetController.userType.value,
                        onChanged: (value) {
                          _forgetController.userType.value = "$value";
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        activeColor: backIconClr,
                        title: Text('Email'),
                        value: 'email',
                        groupValue: _forgetController.userType.value,
                        onChanged: (value) {
                          _forgetController.userType.value = "$value";
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 58.h,
              ),
              Obx(
                () => Text(
                  _forgetController.userType.value == "phone"
                      ? 'Enter Your Phone'
                      : 'Enter Your Email',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff555957)),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Obx(
                () => Form(
                  key: _formKey,
                  child: _forgetController.userType.value == "phone"
                      ? IntlPhoneField(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 16.w),
                            fillColor:
                                const Color(0xFFD9F1E5).withOpacity(0.62),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF187949)
                                        .withOpacity(0.2),
                                    width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF187949)
                                        .withOpacity(0.2),
                                    width: 0.5)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xff187949)
                                        .withOpacity(0.2),
                                    width: 0)),
                            hintText: "Enter your phone",
                          ),
                          initialCountryCode: 'CA',
                          onChanged: (phone) {
                            _forgetController.phoneController.text =
                                phone.completeNumber;
                            debugPrint(_forgetController.phoneController.text);
                          },
                        )
                      : CustomeTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is Empty';
                            } else if (!CommonData.emailValidator
                                .hasMatch(value)) {
                              return 'Enter valid email';
                            }
                            return null;
                          },
                          controller: _forgetController.phoneController,
                          hintText: 'Enter Your Email',
                        ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),

              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _forgetController.resetPasswordOTPByEmail();
                  }
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
                          width: _forgetController.isLoading.value ? 5.w : 0,
                        ),
                      ),
                      Obx(() {
                        if (_forgetController.isLoading.value) {
                          return SizedBox(
                            height: 15.sp,
                            width: 15.sp,
                            child: CircularProgressIndicator(
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
              //   onTap: () {
              //     Get.toNamed(Routes.forgotVerification);
              //   },
              //   title: 'Next',
              // )
            ],
          ),
        ),
      ),
    );
  }
}
