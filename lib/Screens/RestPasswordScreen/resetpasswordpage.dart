import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/widgets/custom_widgets.dart';

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
              'Forgot Password',
            style: myStyle(20, FontWeight.w500, textClr),
            ),
            Text(
              'Create a new password',
             style: myStyle(14, FontWeight.w400, offWhite),
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.sp,
            ),
            Text(
              'New Password',
             style: myStyle(16, FontWeight.w400, textClr),
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
                    borderRadius: BorderRadius.circular(3.r),
                    borderSide: BorderSide(
                      color: themeColorGreen.withOpacity(0.3),
                      width: .2.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.r),
                    borderSide: BorderSide(
                      color: themeColorGreen.withOpacity(0.3),
                      width: .2.w,
                    ),
                  ),
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
             style: myStyle(16, FontWeight.w400, textClr),
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.r),
                    borderSide: BorderSide(
                      color: themeColorGreen.withOpacity(0.3),
                      width: .2.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.r),
                    borderSide: BorderSide(
                      color: themeColorGreen.withOpacity(0.3),
                      width: .2.w,
                    ),
                  ),
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
           customButton(
             onTap: (){},
             title: 'Save',
           )
          ],
        ),
      ),
    );
  }
}
