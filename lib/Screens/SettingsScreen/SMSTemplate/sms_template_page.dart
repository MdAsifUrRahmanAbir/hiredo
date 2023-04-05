import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class SMSTemplatePage extends StatelessWidget {
  SMSTemplatePage({Key? key}) : super(key: key);

  List<String> name = ['Visit'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: backIconClr,
              )),
          title: Text(
            'SMS Templates',
            style: myStyle(20.sp, FontWeight.w500, Colors.black),
          ),
          actions: [
            Image.asset('images/notification.png'),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My template',
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF272727)),
                  ),
                  Container(
                    height: 28.h,
                    width: 104.w,
                    decoration: BoxDecoration(
                        color: Color(0xFF187949),
                        borderRadius: BorderRadius.circular(3.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: Color(0xFFFFFFFF),
                          size: 18.sp,
                        ),
                        Text(
                          'Add template',
                          style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFFFFFF)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: double.infinity,
                height: 52.h,
                padding: EdgeInsets.only(left: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: const Offset(0, 2))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Visit',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 24.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Center(
                        child: Text(
                          'Edit',
                          style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_sweep,
                          color: Color(0xFF848484),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Color(0xFF848484),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Learn more about SMS templates',
                    style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF848484)),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
