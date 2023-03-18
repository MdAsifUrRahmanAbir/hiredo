// ignore_for_file: prefer_const_constructors, unused_local_variable, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/RestPasswordScreen/resetpasswordpage.dart';

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
    return SafeArea(
      child: Scaffold(
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Code',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
              Text(
                'Code has sent to 091*******',
                style: TextStyle(
                    fontSize: 15.sp, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              VerificationCode(
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).primaryColor),
                keyboardType: TextInputType.number,
                fullBorder: true,
                fillColor: Colors.grey.withOpacity(0.1),
                underlineWidth: 1,
                underlineColor:
                    themeColorGreen, // If this is null it will use primaryColor: Colors.red from Theme
                length: 4,
                cursorColor:
                    themeColorGreen, // If this is null it will default to the ambient
                margin: const EdgeInsets.all(5),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Re-send Code in ",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957))),
                  Text("$_counter ",
                      style: TextStyle(fontSize: 15.sp, color: timertxcol)),
                  Text("seconds",
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff555957))),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 45.h,
                width: scwidth - 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: themeColorGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r), // <-- Radius
                      ),
                    ),
                    onPressed: () {
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
                    child: Text(
                      _counter == 0 ? 'Re-send' : 'Next',
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
