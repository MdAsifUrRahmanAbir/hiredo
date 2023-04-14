import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/LeadsDetailsScreen/component/custom_maps.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:jiffy/jiffy.dart';

import '../LeadsScreen/Model/leads_model.dart';

class LeadsDetailsScreen extends StatelessWidget {
  LeadsDetailsScreen({
    super.key,
  });

  LeadsModel leadData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: themeColorGreen,
        ),
        backgroundColor: Colors.white,
        title: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          horizontalTitleGap: 0,
          leading: leadData.user.userProfilePic == null
              ? CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade400,
                )
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                      "$baseUrl${leadData.user.userProfilePic!.picture}"),
                ),
          title: Text(
            leadData.user.fullName,
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
        ),
        actions: [Image.asset('images/notification.png')],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  leadData.category.name,
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                              ),
                              Container(
                                height: 27.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE8FAF1),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_filled,
                                      size: 15.h,
                                      color: const Color(0xFF187949),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      Jiffy.parse(leadData.created).fromNow(),
                                      style: GoogleFonts.roboto(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF187949)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // ListTile(

                          Row(
                            children: [
                              Image.asset(
                                "images/location.png",
                                height: 15.h,
                                width: 11.w,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                leadData.location,
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF424242)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Color(0xFF187949),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 8.w,
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
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: Color(0xFF187949),
                          size: 20.sp,
                        ),
                        SizedBox(
                          width: 8.w,
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
                            backgroundColor: const Color(0xFF187949),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: const Color(0xFF187949),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: const Color(0xFF187949),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: const Color(0xFFF2F2F2),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: const Color(0xFFF2F2F2),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          const Spacer(),
                          Text(
                            leadData.responseCount == 0
                                ? "${leadData.responseCount} Professionals did not respond"
                                : '${leadData.responseCount - 1}/${leadData.responseCount - 1} professionals have responded',
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
                                border:
                                    Border.all(color: const Color(0xFF292D32))),
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
                              border:
                                  Border.all(color: const Color(0xFF187949)),
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
                          "images/b.png",
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "${leadData.postCredit} Credits",
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
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
                        final qansData = leadData.postObject[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              qansData.question.qs,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              qansData.pAnswer.options,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                          ],
                        );
                      },
                      itemCount: leadData.postObject.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    //   child: Divider(
                    //     color: const Color(0xFF848484).withOpacity(0.05),
                    //     height: 5.h,
                    //     thickness: 3,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // Text(
                    //   'Not seeing the right leads?',
                    //   style: GoogleFonts.roboto(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w400,
                    //       color: const Color(0xFF272727)),
                    // ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // Text(
                    //   'Stop seeing leads with specific answers by customising your settings.',
                    //   style: GoogleFonts.roboto(
                    //       fontSize: 14.sp,
                    //       fontWeight: FontWeight.w400,
                    //       color: const Color(0xFF424242)),
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    // Row(
                    //   children: [
                    //     Image.asset('images/settings2.png'),
                    //     SizedBox(
                    //       width: 5.w,
                    //     ),
                    //     Text(
                    //       'Update lead settings',
                    //       style: GoogleFonts.roboto(
                    //           fontSize: 14.sp,
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xFF187949)),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 200.h, child: CustomMaps()),
              SizedBox(
                height: 20.h,
              ),
            ],
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
