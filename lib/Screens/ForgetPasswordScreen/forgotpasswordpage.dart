// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';

import '../../utils/colors.dart';

class ForegPasswordPage extends StatefulWidget {
  static const String routename = '/forgetpasswordpage';
  const ForegPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForegPasswordPage> createState() => _ForegPasswordPageState();
}

String? accounttype = "phone";
final phoneController = TextEditingController();

class _ForegPasswordPageState extends State<ForegPasswordPage> {
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
          title: Text(
            'Forgot Password?',
            style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.5)),
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
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: themeColorGreen,
                        title: Text('Phone'),
                        value: "phone",
                        groupValue: accounttype,
                        onChanged: (value) {
                          setState(() {
                            accounttype = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: themeColorGreen,
                        title: Text('Email'),
                        value: "email",
                        groupValue: accounttype,
                        onChanged: (value) {
                          setState(() {
                            accounttype = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                accounttype == 'phone'
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
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: themeColorGreen.withOpacity(0.1),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                hintText: '+880100000000'),
                          ),
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
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: themeColorGreen.withOpacity(0.1),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                hintText: 'h@gmail.com'),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 30.h,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VerificationPage()));
                      },
                      child: Text(
                        'Next',
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
