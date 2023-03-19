import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/BrowserNotification/Controller/browser_controller.dart';

class BrowserNotification extends StatelessWidget {
  BrowserNotification({super.key});

  final _browserController = Get.put(BrowserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        actions: [Image.asset('images/notification.png')],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Browser notifications',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 127.h,
              padding: EdgeInsets.only(top: 15.h, left: 5.w, right: 10.w),
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xFFF9F9FA)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/mark.png'),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Text(
                      "We can send notifications straight to your web browser. Choose what you’d like to be notified about. Note: If you’d like to control what notifications you receive in our mobile apps, please head to the settings within your app.",
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF515053)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Notify me about:',
              style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6E6874)),
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 57.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: Colors.grey.withOpacity(0.1))),
                  child: Obx(
                    () => ListTile(
                      title: Text(
                        _browserController.items[index],
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(39, 39, 39, 1)),
                      ),
                      trailing: Switch(
                          onChanged: (value) {
                            _browserController.selected[index] = value;
                          },
                          value: _browserController.selected[index],
                          activeColor: Colors.white,
                          activeTrackColor: const Color(0xFF47BF9C),
                          inactiveThumbColor: Colors.pink,
                          inactiveTrackColor: Colors.green),
                    ),
                  ),
                );
              },
              itemCount: _browserController.items.length,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 10.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 150.w,
                ),
                Text(
                  'Cancel',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727)),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 45.h,
                  width: 109.w,
                  decoration: BoxDecoration(
                      color: const Color(0xFF187949),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/tick_mark.png'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Save',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
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
          ],
        ),
      ),
    );
  }
}
