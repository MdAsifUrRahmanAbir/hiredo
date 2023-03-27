import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/HomeScreen/home.dart';
import 'package:myapp/Screens/LeadsDetailsScreen/leads_details_screen.dart';

import '../../nav_bar_page/nav_bar_controller.dart';
import '../../utils/colors.dart';

class LeadsScreen extends StatefulWidget {
  static const String routename = '/leadscreen';
  LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  List<Map> item = [
    {
      'image': 'images/kumar.png',
      'title': 'Kumar',
      'time': '3m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/rahman.png',
      'title': 'Reduan',
      'time': '5m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/haq.png',
      'title': 'Jhon Smith',
      'time': '7m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/rahman.png',
      'title': 'Rahman',
      'time': '7m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/haq.png',
      'title': 'Tasmia Haq',
      'time': '9m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Leads',
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
      body: ListView(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.withOpacity(0.3),
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green.withOpacity(0.3),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 50.h,
                color: const Color(0xff187949),
                child: Row(
                  children: [
                    Text(
                      'Filter',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFFFFFF)),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: 70.h,
            padding: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(7.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '431 matching leads',
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Image.asset('images/service.png'),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '61 Services',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF454545)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 1.w,
                          color: const Color(0xFF187949),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Image.asset('images/location.png'),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          '61 Services',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF454545)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 77.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFF187949),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/edit.png',
                        color: const Color(0xFFFFFFFF),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Edit',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFF2F2F2)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Showing all 431 leads',
            style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF686868)),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LeadsDetailsScreen(
                                image: item[index]['image'],
                                name: item[index]['title'],
                                time: item[index]['time'],
                                locationImage: item[index]['locationImage'],
                                address: item[index]['address'],
                                bImage: item[index]['bImage'],
                                credit: item[index]['credit'],
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: AssetImage(item[index]['image']),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item[index]['title'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                Image.asset('images/run.png'),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Plumbing',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Image.asset(item[index]['locationImage']),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  item[index]['address'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 27.h,
                          width: 77.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE8FAF1),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_filled_rounded,
                                color: Color(0xFF187949),
                              ),
                              Text(
                                item[index]['time'],
                                style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Additional Details:',
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF187949)),
                          children: [
                            TextSpan(
                                text:
                                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                                style: GoogleFonts.roboto(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF848484)))
                          ]),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Image.asset(item[index]['bImage']),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          item[index]['credit'],
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF272727)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Divider(
                      color: Color(0xFF424242),
                    )
                  ],
                ),
              );
            },
            itemCount: item.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 25.h,
              );
            },
          )
        ],
      ),
    );
  }
}
