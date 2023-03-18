import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class BadgesSecondPage extends StatefulWidget {
  const BadgesSecondPage({Key? key}) : super(key: key);

  @override
  State<BadgesSecondPage> createState() => _BadgesSecondPageState();
}

class _BadgesSecondPageState extends State<BadgesSecondPage> {
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
              color: Color(0xff187949),
            )),
        title: Text(
          'Badges',
          style: myStyle(20.sp, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
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
                  Image.asset('images/badges.png'),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Golden Badges',
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
              height: 15.h,
            ),
            Text(
              'Golden Badge Advantage',
              style: myStyle(18.sp, FontWeight.w500, textClr),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
              style: myStyle(14.sp, FontWeight.w400, textClr),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 18.sp,
                  color: themeColorGreen,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: Text(
                  'Lorem Ipsum is simply dummy text of has been the industrys. Lorem Ipsum is simply dummy text of the printing.',
                  style: myStyle(14.sp, FontWeight.w400, offWhite),
                ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 18.sp,
                  color: themeColorGreen,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: Text(
                  'Lorem Ipsum is simply dummy text of has been the industrys. Lorem Ipsum is simply dummy text of the printing.',
                  style: myStyle(14.sp, FontWeight.w400, offWhite),
                ))
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Bye/Sale More Services And get Dimond Badge',
              style: myStyle(18.sp, FontWeight.w500, textClr),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
              style: myStyle(14.sp, FontWeight.w400, offWhite),
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
