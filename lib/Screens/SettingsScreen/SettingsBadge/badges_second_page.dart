import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

class BadgesSecondPage extends StatelessWidget {
  BadgesSecondPage({
    Key? key,
  }) : super(key: key);
  Map data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String image = data["image"];
    String title = data["title"];
    String longDescription = data["des"];
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
          'Badges',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.w),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: containerClr),
              child: Row(
                children: [
                  Image.network(
                    image,
                    height: 100.h,
                    width: 80.w,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: myStyle(
                            18.sp, FontWeight.w500, themeColorGreenbright),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys. ',
                        style: myStyle(14.sp, FontWeight.w400, offWhite),
                      )
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You are  In Golden Badge Member',
                  style: myStyle(14.sp, FontWeight.w400, textClr),
                ),
                Text(
                  '2/3',
                  style: myStyle(14.sp, FontWeight.w500, textClr),
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: themeColorGreen),
                )),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                    child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: themeColorGreen),
                )),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                    child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: textformback),
                )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            HtmlWidget(
              longDescription,
              textStyle: TextStyle(fontSize: 18.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'See How to get Dimond Badge Member',
              style: myStyle(18.sp, FontWeight.w500, themeColorGreenbright),
            )
          ],
        ),
      ),
    );
  }
}
