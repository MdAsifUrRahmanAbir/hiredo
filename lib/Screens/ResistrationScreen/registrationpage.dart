// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/SignUpAccountScreen/signupaccountchoosepage.dart';

import '../../utils/colors.dart';

class RegistrationPage extends StatefulWidget {
  static const String routename = '/registrationpage';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();
final nameController = TextEditingController();
final dateController = TextEditingController();
final numberController = TextEditingController();
final corpunameController = TextEditingController();
final corpunumController = TextEditingController();
String errMsg = '';
bool visiblepass = false;
bool visiblepass2 = false;

class _RegistrationPageState extends State<RegistrationPage> {
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
                  Text(
                    'Full name',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Enter full name'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Enter your email',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Password',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !visiblepass,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        suffixIcon: visiblepass
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass
                                        ? visiblepass = false
                                        : visiblepass = true;
                                  });
                                },
                                icon:
                                    Icon(Icons.visibility, color: Colors.black))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass
                                        ? visiblepass = false
                                        : visiblepass = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Confirm Password',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: confirmpasswordController,
                    obscureText: !visiblepass2,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        suffixIcon: visiblepass2
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass2
                                        ? visiblepass2 = false
                                        : visiblepass2 = true;
                                  });
                                },
                                icon:
                                    Icon(Icons.visibility, color: Colors.black))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass2
                                        ? visiblepass2 = false
                                        : visiblepass2 = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Date of birth',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: dateController,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '01/01/2000',
                        suffixIcon: Icon(Icons.calendar_today)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Number',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '+880100000000'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Corporate Name',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: corpunameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Frelence learning center'),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Corporate Number',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    controller: corpunumController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '+980000000'),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: scwidth - 18,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.r), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignInPage()));
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
