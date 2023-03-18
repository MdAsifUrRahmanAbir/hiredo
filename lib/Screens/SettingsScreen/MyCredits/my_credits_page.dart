import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class MyCreditsPage extends StatefulWidget {
  const MyCreditsPage({Key? key}) : super(key: key);

  @override
  State<MyCreditsPage> createState() => _MyCreditsPageState();
}

class _MyCreditsPageState extends State<MyCreditsPage> {
  bool status = false;
  bool value = false;

  List<Map> details = [
    {
      'id': '24131012',
      'description': '10 credits used to reply to customer',
      'credits': '-10',
      'date': 'Jan 23, 2023'
    },
    {
      'id': '24131012',
      'description': '10 credits used to reply to customer',
      'credits': '-10',
      'date': 'Jan 23, 2023'
    },
    {
      'id': '24131012',
      'description': '10 credits used to reply to customer',
      'credits': '-10',
      'date': 'Jan 23, 2023'
    },
    {
      'id': '24131012',
      'description': '10 credits used to reply to customer',
      'credits': '-10',
      'date': 'Jan 23, 2023'
    },
    {
      'id': '24131012',
      'description': '10 credits used to reply to customer',
      'credits': '-10',
      'date': 'Jan 23, 2023'
    }
  ];

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/credits.png',
              width: 30.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'My Credits',
              style: myStyle(20.sp, FontWeight.bold, Colors.black),
            ),
          ],
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
        padding: EdgeInsets.all(13.w),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Credits',
                style: myStyle(20.sp, FontWeight.w500, textClr),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
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
                                children: <TextSpan>[
                              TextSpan(
                                  text: '\nMy Profile',
                                  style: myStyle(
                                      14.sp, FontWeight.w400, themeColorGreen))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  FlutterSwitch(
                    activeColor: themeColorGreen,
                    width: 55.0.w,
                    height: 28.0.h,
                    toggleSize: 22.0.sp,
                    value: status,
                    borderRadius: 30.0.r,
                    padding: 4.0.w,
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Auto top-up is',
                    style: myStyle(14.sp, FontWeight.w400, textClr),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: textformback),
                    child: Text(
                      'Off',
                      style: myStyle(8.sp, FontWeight.w400, themeColorGreen),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'You have 64 credits',
                    style: myStyle(14.sp, FontWeight.w400, textClr),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: offWhite, width: .5),
                      bottom: BorderSide(color: offWhite, width: .5)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About 5 responses',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/credits.png',
                              width: 30.w,
                            ),
                            Text(
                              '30 credits',
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                        Text(
                          '\$63.00\n\$2.10/credit',
                          style: myStyle(12.sp, FontWeight.w400, textClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: scaffoldClr,
                          activeColor: themeColorGreen,
                          hoverColor: themeColorGreen,
                          value: value,
                          side: const BorderSide(
                              color: themeColorGreen, width: 2),
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Auto top-up next time',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: themeColorGreen),
                          child: Text(
                            'Buy Credits',
                            style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: offWhite, width: .5),
                      bottom: BorderSide(color: offWhite, width: .5)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About 10 responses',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/credits.png',
                              width: 30.w,
                            ),
                            Text(
                              '60 credits',
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                        Text(
                          '\$119.70\n\$2.00/credit',
                          style: myStyle(12.sp, FontWeight.w400, textClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: scaffoldClr,
                          activeColor: themeColorGreen,
                          hoverColor: themeColorGreen,
                          value: value,
                          side: const BorderSide(
                              color: themeColorGreen, width: 2),
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Auto top-up next time',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: themeColorGreen),
                          child: Text(
                            'Buy Credits',
                            style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: offWhite, width: .5),
                      bottom: BorderSide(color: offWhite, width: .5)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'About 120 responses',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/credits.png',
                              width: 30.h,
                            ),
                            Text(
                              '120 credits',
                              style: myStyle(14.sp, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                        Text(
                          '\$168.00\n\$1.85/credit',
                          style: myStyle(12.sp, FontWeight.w400, textClr),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: scaffoldClr,
                          activeColor: themeColorGreen,
                          hoverColor: themeColorGreen,
                          value: value,
                          side: const BorderSide(
                              color: themeColorGreen, width: 2),
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Auto top-up next time',
                          style: myStyle(14.sp, FontWeight.w400, textClr),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: themeColorGreen),
                          child: Text(
                            'Buy Credits',
                            style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    color: containerClr,
                    borderRadius: BorderRadius.circular(3.w)),
                child: Row(
                  children: [
                    Image.asset(
                      'images/visa.png',
                      width: 30.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                        child: Text(
                      'We ll charge the card ending 2518 that we have on file',
                      style: myStyle(12.sp, FontWeight.w400, textClr),
                    )),
                    Text(
                      'Change',
                      style: myStyle(
                          12.sp, FontWeight.w400, themeColorGreenbright),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Redeem coupon',
                style: myStyle(12.sp, FontWeight.w400, textClr),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 180.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'coupon code',
                        fillColor: textformback,
                        filled: true,
                        hintStyle: myStyle(12.sp, FontWeight.w400, offWhite),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 35.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(color: themeColorGreen, width: 1)),
                    child: Text(
                      'Apply',
                      style: myStyle(14.sp, FontWeight.w400, textClr),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Credit transaction log',
                style: myStyle(18.sp, FontWeight.w500, textClr),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                height: 30.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: containerClr),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ID',
                      style: myStyle(12.sp, FontWeight.w400, textClr),
                    ),
                    Text(
                      'Description',
                      style: myStyle(12.r, FontWeight.w400, textClr),
                    ),
                    Text(
                      'Credits',
                      style: myStyle(12.r, FontWeight.w400, textClr),
                    ),
                    Text(
                      'Date',
                      style: myStyle(12.h, FontWeight.w400, textClr),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: offWhite, width: 1),
                                bottom: BorderSide(color: offWhite, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              details[index]['id'],
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            ),
                            Text(
                              details[index]['description'],
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            ),
                            Text(
                              details[index]['credits'],
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            ),
                            Text(
                              details[index]['date'],
                              style: myStyle(12.sp, FontWeight.w400, textClr),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                  itemCount: details.length),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
