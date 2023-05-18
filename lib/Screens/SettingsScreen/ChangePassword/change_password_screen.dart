import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/ResistrationScreen/component/custome_text_field.dart';
import 'package:homelyknock/Screens/SettingsScreen/ChangePassword/Controller/change_password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final _changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 43.h,
                    width: 43.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: const Color(0xFF187949),
                            size: 18.sp,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Change password',
                        style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF555957)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Create a new password',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF798079)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              _customText(title: 'Old Password'),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => CustomeTextField(
                  hintText: '********',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: !_changePasswordController.isVisibility.value,
                  controller: _changePasswordController.oldPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is Empty';
                    } else if (value.length < 8) {
                      return '8 character requried is password';
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      onTap: () {
                        _changePasswordController.isVisibility.value =
                            !_changePasswordController.isVisibility.value;
                      },
                      child: Icon(
                          _changePasswordController.isVisibility.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _customText(title: 'New Password'),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => CustomeTextField(
                  hintText: '********',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: !_changePasswordController.isVisible.value,
                  controller: _changePasswordController.newPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is Empty';
                    } else if (value.length < 8) {
                      return '8 character requried is password';
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                      onTap: () {
                        _changePasswordController.isVisible.value =
                            !_changePasswordController.isVisible.value;
                      },
                      child: Icon(
                          _changePasswordController.isVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _customText(title: 'Confirm New Password'),
              SizedBox(
                height: 10.h,
              ),
              Obx(
                () => CustomeTextField(
                  hintText: '********',
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  obscureText: !_changePasswordController.isVisiblele.value,
                  controller:
                      _changePasswordController.confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field is Empty';
                    } else if (value.length < 8) {
                      return '8 character requried is password';
                    } else if (value !=
                        _changePasswordController.newPasswordController.text) {
                      return 'password do not match';
                    }

                    return null;
                  },
                  suffixIcon: InkWell(
                      onTap: () {
                        _changePasswordController.isVisiblele.value =
                            !_changePasswordController.isVisiblele.value;
                      },
                      child: Icon(
                          _changePasswordController.isVisiblele.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  _changePasswordController.handelChangePassword();
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
                        'Save',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      Obx(
                        () => SizedBox(
                          width: _changePasswordController.isLoading.value
                              ? 5.w
                              : 0,
                        ),
                      ),
                      Obx(() {
                        if (_changePasswordController.isLoading.value) {
                          return SizedBox(
                            height: 15.sp,
                            width: 15.sp,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.white,
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _customText({required String title}) {
    return RichText(
        text: TextSpan(
            text: title,
            style: GoogleFonts.roboto(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF25302B)),
            children: [
          TextSpan(
              text: "*",
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xffDA1414))),
        ]));
  }
}
