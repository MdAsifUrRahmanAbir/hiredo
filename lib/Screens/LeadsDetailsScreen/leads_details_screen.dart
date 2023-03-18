import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/Screens/LeadsDetailsScreen/component/custom_maps.dart';
import 'package:myapp/Screens/ResistrationScreen/registrationpage.dart';

class LeadsDetailsScreen extends StatefulWidget {
  LeadsDetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.locationImage,
      required this.address,
      required this.bImage,
      required this.credit});

  String image;
  String name;
  String time;
  String locationImage;
  String address;
  String bImage;
  String credit;

  @override
  State<LeadsDetailsScreen> createState() => _LeadsDetailsScreenState();
}

class _LeadsDetailsScreenState extends State<LeadsDetailsScreen> {
  List<Map> item = [
    {
      'title': 'What type of property needs cleaning?',
      'subTitle': 'House',
    },
    {
      'title': 'How often do you need cleaning services?',
      'subTitle': 'Every other week',
    },
    {
      'title': 'How many bedroom(s) need cleaning?',
      'subTitle': '3 bedrooms',
    },
    {
      'title': 'How many bathroom(s) need cleaning?',
      'subTitle': '3 bathrooms',
    },
    {
      'title': 'How many reception room(s) need cleaning?',
      'subTitle': '1',
    },
    {
      'title': 'How many staircases need cleaning?',
      'subTitle': 'None',
    },
    {
      'title': 'Which additional service(s) would you like?',
      'subTitle': 'I have pets, No extra requirements',
    },
    {
      'title': 'How many staircases need cleaning?',
      'subTitle': 'None',
    },
    {
      'title': 'When are the best days for cleaning?',
      'subTitle': 'Friday',
    },
    {
      'title': 'Are you ready to hire someone?',
      'subTitle': 'Yes, I need this service ASAP',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF187949),
                        )),
                    CircleAvatar(
                      radius: 15.r,
                      backgroundImage: AssetImage(widget.image),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    SizedBox(
                      width: 160.w,
                    ),
                    Image.asset('images/notification.png')
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        title: Text(
                          'House Cleaning Service',
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF272727)),
                        ),
                        trailing: Container(
                          height: 27.h,
                          width: 76.sp,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE8FAF1),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.access_time_filled),
                              Text(
                                widget.time,
                                style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            Image.asset(widget.locationImage),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(widget.address)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Color(0xFF187949),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      '+122******6***',
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF272727)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      height: 12.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE8FAF1),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/righttick.png',
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            'verified',
                            style: GoogleFonts.roboto(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF187949)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Color(0xFF187949),
                    ),
                    Text(
                      'your******@email.com',
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF272727)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Color(0xFF187949),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Color(0xFF187949),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Color(0xFF187949),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Color(0xFFF2F2F2),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                        radius: 8.r,
                        backgroundColor: Color(0xFFF2F2F2),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        '3/5 professionals have responded',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000)),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        height: 18.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF292D32))),
                        child: const Center(
                          child: Text('!'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Container(
                      height: 50.h,
                      width: 148.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text(
                          'Contact',
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 50.h,
                      width: 148.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF187949)),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Center(
                        child: Text(
                          'Not interested',
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF187949)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      widget.bImage,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      widget.credit,
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF848484)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Details',
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  color: const Color(0xFF848484).withOpacity(0.05),
                  height: 1,
                  thickness: 2,
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item[index]['title'],
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF424242)),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          item[index]['subTitle'],
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF424242)),
                        ),
                      ],
                    );
                  },
                  itemCount: item.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 20.h,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(height: 200.h, child: CustomMaps()),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Divider(
                    color: const Color(0xFF848484).withOpacity(0.05),
                    height: 5.h,
                    thickness: 3,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Not seeing the right leads?',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF272727)),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Stop seeing leads with specific answers by customising your settings.',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF424242)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Image.asset('images/settings2.png'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Update lead settings',
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF187949)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customeText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF424242)),
    );
  }
}
