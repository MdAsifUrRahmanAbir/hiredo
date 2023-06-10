import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/utils/colors.dart';

import '../../GoogleMapService/google_map_show.dart';
import '../TrackingScreen/Model/pending_book_now_model.dart';

class CompleteBuyerBookingDetails extends StatelessWidget {
  const CompleteBuyerBookingDetails({super.key, required this.data});

 final PendingBookNowModel data;

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
        centerTitle: true,
        title: Text(
          "Complete Booking Details",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
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
                      height: 185.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          image: DecorationImage(
                              image: NetworkImage(data.category.image),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      data.category.name,
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    Text(
                      data.location,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Container(
                      //  height: 147.h,
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(top: 15.h, left: 5.w, bottom: 15.h),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data.bookedInUser.userProfilePic == null
                              ? CircleAvatar(
                                  radius: 25.h,
                                  backgroundColor: Colors.grey.shade400,
                                )
                              : CircleAvatar(
                                  radius: 25.h,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      data.bookedInUser.userProfilePic),
                                ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.bookedInUser.fullName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  data.bookedInUser.email,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF424242)),
                                ),
                                Text(
                                  data.bookedInUser.phoneNumber,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF424242)),
                                ),

                                // Row(
                                //   children: [
                                //     Icon(
                                //       Icons.star,
                                //       color: Color(0xFFEACA23),
                                //       size:20.sp,
                                //     ),
                                //     SizedBox(
                                //       width: 3.w,
                                //     ),
                                //     Text(
                                //       '3.5',
                                //       style: GoogleFonts.roboto(
                                //           fontSize: 14.sp,
                                //           fontWeight: FontWeight.w400,
                                //           color: Color(0xFF424242)),
                                //     ),
                                //     SizedBox(
                                //       width: 3.w,
                                //     ),

                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                        final qansData = data.realtimePostObject[index];
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
                      itemCount: data.realtimePostObject.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 200.h,
                  child: GoogleMapsShow(
                    lat: data.latitude,
                    leng: data.longitude,
                  )),
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
