import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';

import '../../utils/colors.dart';
import '../SettingsScreen/setting_page.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Massages',
          style: myStyle(20.sp, FontWeight.w500, const Color(0xFF272727)),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/img2.png'),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    onChanged: (v) {
                      if (v.isEmpty) {}
                    },
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
              InkWell(
                onTap: () {},
                child: Container(
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.chatScreen);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                    child: Row(
                      children: [
                        Stack(children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                const AssetImage('images/img2.png'),
                          ),
                          Positioned(
                              top: 38.w,
                              right: 1.w,
                              child: Container(
                                height: 18.h,
                                width: 18.w,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF008A00),
                                    shape: BoxShape.circle),
                              ))
                        ]),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jasim Uddnin',
                                style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Yes, i’m Good.',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)
                                        .withOpacity(0.5)),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        )),
                        Column(
                          children: [
                            Text(
                              '10:17',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF187949).withOpacity(0.3),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
