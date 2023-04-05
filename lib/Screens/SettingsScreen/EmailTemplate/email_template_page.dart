import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class EmailTemplatePage extends StatelessWidget {
 
  EmailTemplatePage({Key? key}) : super(key: key);

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
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
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
    );
  }
}
