import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/SettingsScreen/SettingsBadge/badges_second_page.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class BadgePage extends StatefulWidget {
  static const String routename = '/badgepage';
  BadgePage({Key? key}) : super(key: key);

  @override
  State<BadgePage> createState() => _BadgePageState();
}

class _BadgePageState extends State<BadgePage> {
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
              Navigator.of(context).pop();
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
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                'Badge',
                style: myStyle(20.sp, FontWeight.w500, textClr),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.all(10.w),
              color: containerClr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: themeColorGreenbright,
                    size: 27.sp,
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
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                              children: [
                            TextSpan(
                                text: ' Learn More',
                                style: myStyle(
                                    14.sp, FontWeight.w400, themeColorGreen))
                          ])),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            badge_item(
              text: 'The Reviews Badge',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BadgesSecondPage(),
                ));
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            badge_item(
              text: 'The Elite Pro Badge',
              onTap: () {},
            ),
            SizedBox(
              height: 8.h,
            ),
            badge_item(
              text: 'The Professional Badge',
              onTap: () {},
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Row(
                children: [
                  Icon(
                    Icons.question_mark,
                    size: 18.sp,
                    color: themeColorGreenbright,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Why use Ringknock Badges',
                    style: myStyle(20.sp, FontWeight.w500, textClr),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                // margin: EdgeInsets.all(15.w),
                padding: EdgeInsets.all(10.w),
                color: containerClr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Upgrading your app with a ringknock badge helps boost search engine rankings (SEO) and attractsmore customers',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Visitors to your website will be able to see your reviews and leave their own. This increases customer trust, gaining you more business - for free',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                          overflow: TextOverflow.clip,
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Customers are much more likely to hire professionals with 1 or more badges on display',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class badge_item extends StatelessWidget {
  badge_item({super.key, this.onTap, this.text});
  Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
      decoration: BoxDecoration(
        color: scaffoldClr,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/bark.png'),
          Column(
            children: [
              Text(
                text!,
                style: myStyle(14.sp, FontWeight.bold, textClr),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Amet minim mollit non\ndeseruntullamco est sit',
                style: myStyle(14.sp, FontWeight.w400, textClr),
              )
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 35.h,
              width: 75.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: themeColorGreen),
              child: Text(
                'Select',
                style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
              ),
            ),
          )
        ],
      ),
    );
  }
}
