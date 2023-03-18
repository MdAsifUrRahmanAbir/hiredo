import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String routename = '/resetpasspage';
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();
String errMsg = '';
bool visiblepass = false;
bool visiblepass2 = false;

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
                  icon: const Icon(
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
                'Forgot Password',
                style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Create a new password',
                style: GoogleFonts.roboto(
                    fontSize: 15.sp, color: Colors.black.withOpacity(0.6)),
              )
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(22.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  'New Password',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: const Color(0xff25302B),
                      fontWeight: FontWeight.w400),
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
                      focusedBorder: const OutlineInputBorder(
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
                              icon: const Icon(Icons.visibility,
                                  color: Colors.black))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  visiblepass
                                      ? visiblepass = false
                                      : visiblepass = true;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )),
                      hintText: '********',
                      labelStyle: const TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Confirm Password',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: Color(0xff25302B),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                TextFormField(
                  controller: confirmpasswordController,
                  obscureText: !visiblepass2,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: themeColorGreen.withOpacity(0.1),
                      //prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                      focusedBorder: const OutlineInputBorder(
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
                              icon: const Icon(Icons.visibility,
                                  color: Colors.black))
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  visiblepass2
                                      ? visiblepass2 = false
                                      : visiblepass2 = true;
                                });
                              },
                              icon: const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              )),
                      hintText: '********',
                      labelStyle: const TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 28.h,
                ),
                SizedBox(
                  height: 50.h,
                  width: MediaQuery.of(context).size.width - 22,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColorGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.r), // <-- Radius
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
