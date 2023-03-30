import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class EmailTemplatePage extends StatefulWidget {
  static const String routename = '/';
  EmailTemplatePage({Key? key}) : super(key: key);

  @override
  State<EmailTemplatePage> createState() => _EmailTemplatePageState();
}

class _EmailTemplatePageState extends State<EmailTemplatePage> {
  List<String> name = ['Bathroom', 'Kitchen', 'Renovation'];
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
          'Email Templates',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My templates',
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727)),
                ),
                Container(
                  height: 28.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFF187949),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 12.sp,
                        color: scaffoldClr,
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
              height: 15.h,
            ),
            itemContainer(title: 'Bathroom'),
            SizedBox(
              height: 10.h,
            ),
            itemContainer(title: 'Kitchen'),
            SizedBox(
              height: 10.h,
            ),
            itemContainer(title: 'Renovation'),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Learn more about email templates',
                  style: myStyle(12.sp, FontWeight.w400, offWhite),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemContainer({required String title}) {
    return Container(
      height: 52.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 10.w),
      margin: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1)
          ],
          borderRadius: BorderRadius.circular(3.r)),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
          Spacer(),
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
              icon: Icon(
                Icons.delete_sweep,
                color: Color(0xFF848484),
              ))
        ],
      ),
    );
  }
}
