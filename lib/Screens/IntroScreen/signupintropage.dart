// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/SignInScreen/signinpage.dart';

import '../SignUpAccountScreen/signupaccountchoosepage.dart';
import '../../utils/colors.dart';

class SignIntroPage extends StatefulWidget {
  static const String routename = '/signupintropage';
  const SignIntroPage({Key? key}) : super(key: key);

  @override
  State<SignIntroPage> createState() => _SignIntroPageState();
}

class _SignIntroPageState extends State<SignIntroPage> {
  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Image.asset(
                'images/img3.png',
                width: scw,
                height: sch / 2,
              ),
              Padding(
                padding: EdgeInsets.all(38.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Choose your service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Ringknock is an online on demand service.'
                      'It has as into 50k+ services.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff555957)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 47.h,
                      width: scw - 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColorGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10.r), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignAccountChoosePage()));
                          },
                          child: Text(
                            'Create Profile',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 18.sp),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555957)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignInPage()));
                            },
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.roboto(
                                  color: themeColorGreen,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Text(''),
              Text(''),
              Text('')
            ],
          ),
        ),
      ),
    );
  }
}
