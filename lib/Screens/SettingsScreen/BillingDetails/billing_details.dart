import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_widgets.dart';

class BillingDetails extends StatelessWidget {
  BillingDetails({Key? key}) : super(key: key);

 final List<Map> downloads = [
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': containerClr
    },
    {
      'invoice': '3328581',
      'date': 'Jan 11/22',
      'total': '\$214.00',
      'color': textformback
    },
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
      body: Container(
        padding: EdgeInsets.all(15.w),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice And Billing',
                style: myStyle(20.sp, FontWeight.w500, Colors.black),
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
                                  text: '\nMy Profile',
                                  style: myStyle(
                                      14.sp, FontWeight.w400, themeColorGreen))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: offWhite.withOpacity(0.3),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Billing Details',
                style: myStyle(16.sp, FontWeight.w500, textClr),
              ),
              Text(
                'Your business address for billing & invoicing',
                style: myStyle(14.sp, FontWeight.w400, textClr),
              ),
              SizedBox(
                height: 20.h,
              ),
              _titleText(title: 'Contact name'),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFieldForm(
                hintText: 'Build Wright',
              ),
              SizedBox(
                height: 10.h,
              ),
              _titleText(title: 'Address line 1'),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFieldForm(
                hintText: '2464 Royal Ln. Jersey 45463',
              ),
              SizedBox(
                height: 10.h,
              ),
              _titleText(title: 'Address line 2'),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFieldForm(
                hintText: '2464 Royal Ln. Jersey 45463',
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'City',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff555957)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const CustomTextFieldForm(
                        hintText: 'Oshawa',
                      )
                    ],
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Postal Code',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff555957)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const CustomTextFieldForm(
                        hintText: 'L1K0B5',
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              _titleText(title: 'Phone Number'),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFieldForm(
                hintText: '01888888888',
              ),
              SizedBox(
                height: 10.h,
              ),
              _titleText(title: 'Address line 2'),
              SizedBox(
                height: 5.h,
              ),
              const CustomTextFieldForm(
                hintText: '01888888888',
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(
                thickness: 0.5,
                color: offWhite.withOpacity(0.3),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: textformback),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Invoice#',
                      style: myStyle(14.sp, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Date',
                      style: myStyle(14.sp, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Total',
                      style: myStyle(14.sp, FontWeight.w500, textClr),
                    ),
                    Text(
                      'Invoice',
                      style: myStyle(14.sp, FontWeight.w500, textClr),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        height: 40.h,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: downloads[index]['color']),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              downloads[index]['invoice'],
                              style: myStyle(12.sp, FontWeight.w400, offWhite),
                            ),
                            Text(
                              downloads[index]['date'],
                              style: myStyle(12.sp, FontWeight.w400, offWhite),
                            ),
                            Text(
                              downloads[index]['total'],
                              style: myStyle(12.sp, FontWeight.w400, offWhite),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 26.h,
                              width: 82.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  color: backIconClr),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.arrow_circle_down,
                                    color: scaffoldClr,
                                    size: 12.sp,
                                  ),
                                  Text(
                                    'Download',
                                    style: myStyle(
                                        12.sp, FontWeight.w400, scaffoldClr),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 0.h,
                      ),
                  itemCount: downloads.length),
            ],
          ),
        ),
      ),
    );
  }

  _titleText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff555957)),
    );
  }
}
