// ignore_for_file: prefer_const_constructors, unused_local_variable, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



import 'package:myapp/Screens/RestPasswordScreen/resetpasswordpage.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';

import '../../utils/colors.dart';
import 'Controller/verifyController.dart';

class VerificationPage extends StatelessWidget {
   VerificationPage({Key? key}) : super(key: key);

  final _verificationController = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
    _verificationController.startTimer();
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
              height: 43.h,
              width: 43.w,
              decoration: BoxDecoration(
                color:scaffoldClr,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Code',
             style: myStyle(20, FontWeight.w500, textClr),
            ),
            RichText(
                text: TextSpan(
                    text:
                    'Code has send to ',
                    style: myStyle(14.sp, FontWeight.w400, offWhite),
                    children: [
                      TextSpan(
                          text: '01921*******',
                          style: myStyle(
                              14.sp, FontWeight.w400, backIconClr))
                    ]))
          ],
        ),
      ),
      body: SingleChildScrollView(
       
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            SizedBox(
              height: 63.h,
            ),
            
               VerificationCode(
                underlineUnfocusedColor: backIconClr.withOpacity(0.3),
                fullBorder: true,
                fillColor: backIconClr.withOpacity(0.1),
                underlineWidth: 1,
                length: 4,
                cursorColor:
                    backIconClr, // If this is null it will default to the ambient
                margin:  EdgeInsets.all(5),
                onCompleted: (String value) {
                  
                   _verificationController. code.value = value;
                  
                },
                onEditing: ( value) {
                  
                   _verificationController. onEditing.value = value;
                  
                  if ( _verificationController. onEditing.value) FocusScope.of(context).unfocus();
                },
              ),
            
            SizedBox(
              height: 46.h,
            ),
            Obx
            (()=>
               RichText(
                  text: TextSpan(
                      text:
                      'Resend code in',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF555957)
                      ),
                      children: [
                        TextSpan(
                            text: " ${_verificationController.secounds.value}",
                            style:GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color:_verificationController.isValue.value? Color(0xFF555957):Color(0xFFED282E)
                      ),),
                        TextSpan(
                            text: ' s',
                            style: myStyle(
                                16.sp, FontWeight.w400, offWhite)),
                      ])),
            ),
            SizedBox(
              height: 63.h,
            ),

            Obx
            (()=>
               InkWell(
                onTap: () {


                  if(_verificationController.secounds.value==0){
                     _verificationController.startTimer();

                  }else{
                    _verificationController.timer.cancel();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ResetPasswordPage()));


                  }
                       
                
                 
                
                
                  
              
              },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: backIconClr
                  ),
                  child: Text(_verificationController. secounds.value!=0 ?'Next' : 'Re-send',
                    style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
