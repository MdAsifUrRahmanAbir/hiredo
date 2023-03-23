import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/custom_widgets.dart';

class AccountDetailsPage extends StatefulWidget {
  AccountDetailsPage({Key? key}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Settings',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Account Details',
                style: myStyle(20.sp, FontWeight.w500, textClr),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.w),
                padding: EdgeInsets.all(10.w),
                color: containerClr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: themeColorGreenbright,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: RichText(
                            text: TextSpan(
                                text:
                                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet',
                                style: myStyle(14.sp, FontWeight.w400, Color(0xff555957)),
                                children: [
                              TextSpan(
                                  text: ' \nMy Profile',
                                  style: myStyle(
                                      14.sp, FontWeight.w400, backIconClr))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: .7, color: offWhite.withOpacity(0.3)),
                        bottom: BorderSide(
                            width: .7, color: offWhite.withOpacity(0.3)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact details',
                      style: myStyle(16.sp, FontWeight.w400, textClr),
                    ),
                    SizedBox(height: 8.h,),
                    Text(
                      'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',
                      style: myStyle(14.sp, FontWeight.w400, textClr),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Account email',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomTextFieldForm(
                        hintText: 'suppose@gmail.com',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Preferred contact number',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 50,
                      child: CustomTextFieldForm(
                        hintText: '01888888888',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'SMS notification number',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: CustomTextFieldForm(
                        hintText: '01888888888',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Change Password',
                style: myStyle(16.sp, FontWeight.w400, textClr),
              ),
              Text(
                'Amet minim mollit non deserunt',
                style: myStyle(14.sp, FontWeight.w400, offWhite),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                alignment: Alignment.center,
               width: 147,
                height: 34,
                decoration: BoxDecoration(
                    color: backIconClr,
                    borderRadius: BorderRadius.circular(3.r)),
                child: Text(
                  'Change Password',
                  style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
