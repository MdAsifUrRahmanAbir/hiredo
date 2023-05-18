// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/utils/colors.dart';

import '../../Route/routes.dart';

class SignAccountChoosePage extends StatefulWidget {
  const SignAccountChoosePage({Key? key}) : super(key: key);

  @override
  State<SignAccountChoosePage> createState() => _SignAccountChoosePageState();
}



class _SignAccountChoosePageState extends State<SignAccountChoosePage> {


  String accounttype ="User";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Padding( 
        padding: EdgeInsets.all(18.0.w),
        child: ListView(children: [
          SizedBox(
            height: 150.h,
          ),
          Text(
            'Choose your account category',
            style: GoogleFonts.roboto(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff555957)),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              Text(
                'Choose',
                style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5B5B5B)),
              ),
              Text(
                ' become a professional ',
                style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    color: Color(0xFF187949),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                'option and',
                style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF5B5B5B)),
              )
            ],
          ),
          Text(
            'continue',
            style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5B5B5B)),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: (){
                setState(() {
                      accounttype = "User";
                    });
            },
            child: Container(
                height: 50.h,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(5.r)),
                child: ListTile(
                  minVerticalPadding: 0,
                  visualDensity: VisualDensity(horizontal: 0,vertical: -4),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.only(left:16.w),
                  dense: true,
                  title: Text(
                    'Become a User',
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF373737)),
                  ),
                  trailing: Radio(
                    activeColor: themeColorGreen,
                    value: 'User',
                    groupValue: accounttype,
                    onChanged: (value) {
                      setState(() {
                        accounttype = value!;
                      });
                    },
                  ),
                )),
          ),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: (){
                setState(() {
                      accounttype = "Professional";
                    });
            },
            child: Container(
                height: 50.h,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(5.r)),
                child: ListTile(
                   minVerticalPadding: 0,
                  visualDensity: VisualDensity(horizontal: 0,vertical: -4),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.only(left:16.w),
                  dense: true,
                  title: Text(
                    'Become a Professional',
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF373737)),
                  ),
                  trailing: Radio(
                    activeColor: themeColorGreen,
                    value: 'Professional',
                    groupValue: accounttype,
                    onChanged: (value) {
                      setState(() {
                        accounttype = value.toString();
                      });
                    },
                  ),
                )),
          ),
          SizedBox(
            height: 40.h,
          ),
          InkWell(
            onTap: () {

              Get.toNamed(Routes.signUpPage,arguments:accounttype);
            
            },
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF187949),
                  borderRadius: BorderRadius.circular(4.r)),
              child: Center(
                child: Text(
                  'Next',
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
