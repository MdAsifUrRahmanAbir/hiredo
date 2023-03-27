// ignore_for_file: prefer_const_constructors, unused_local_variable, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/RestPasswordScreen/resetpasswordpage.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';

import '../../utils/colors.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

bool _onEditing = true;
String? _code;
CountdownController countdownController =
    CountdownController(duration: Duration(minutes: 1));

class _VerificationPageState extends State<VerificationPage> {
  int _counter = 0;
  int click = 0;
  late Timer _timer;
  Color timertxcol = themeColorGreen;
  void _startTimer() {
    _counter = 60;
    _timer = Timer.periodic(Duration(milliseconds: 1550), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else if (_counter == 0) {
        timertxcol = Colors.red;
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
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
                setState(() {
                  _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
                if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            RichText(
                text: TextSpan(
                    text:
                    'Resend code in',
                    style: myStyle(16.sp, FontWeight.w400, offWhite),
                    children: [
                      TextSpan(
                          text: ' 56 ',
                          style: myStyle(
                              16.sp, FontWeight.w400, backIconClr)),
                      TextSpan(
                          text: 's',
                          style: myStyle(
                              16.sp, FontWeight.w400, offWhite)),
                    ])),
            SizedBox(
              height: 30.h,
            ),

            GestureDetector(
              onTap: () {
              setState(() {
                _startTimer();
                click++;
              });
              if (click > 2) {
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
                child: Text( _counter == 0 ? 'Re-send' : 'Next',
                  style: myStyle(18.sp, FontWeight.w500, scaffoldClr),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
