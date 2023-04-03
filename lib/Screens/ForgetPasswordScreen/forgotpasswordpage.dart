// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';
import 'package:myapp/Screens/ForgetPasswordScreen/Controller/forget_controller.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/widgets/custom_widgets.dart';

import '../../utils/colors.dart';

class ForegPasswordPage extends StatelessWidget {
  ForegPasswordPage({Key? key}) : super(key: key);

  final _forgetController = Get.put(ForgetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Navigator.pop(context);
                  },
                )),
          ),
          title: Text(
            'Forgot Password?',
            style: myStyle(20, FontWeight.w500, textClr),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(18.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
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
                  height: 50.h,
                ),
                Obx(() => _forgetController.userType.value == 'phone'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Your Phone',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555957)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFieldForm(
                            controller:_forgetController. phoneController,
                            hintText: 'Enter your phone',
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Your Email',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555957)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextFieldForm(
                            controller:_forgetController. phoneController,
                            hintText: 'Enter your email',
                          )
                        ],
                      )),
                SizedBox(
                  height: 30.h,
                ),
                customButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => VerificationPage()));
                  },
                  title: 'Next',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


