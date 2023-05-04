import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SalerBookingDetails/saler_booking_details.dart';

import '../../../utils/colors.dart';

class BookingPandeingScreen extends StatelessWidget {
  const BookingPandeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 171.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF187949).withOpacity(0.07),
                    blurRadius: 7,
                    spreadRadius: 0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(3.r),
                      child: Image.asset(
                        'images/ima3.png',
                        height: 89.h,
                        width: 80.w,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Commercial cleaning by Expertise',
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color:const Color(0xff272727)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "WebDeveloper",
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff555957)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_pin,color:themeColorGreen,size:15.sp,),
                          Text("Dhaka ,Bangladesh",style: GoogleFonts.roboto(fontSize:14.sp,color:const Color(0xFF848484)),)
                        ],
                      )
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 90.w,),
                  InkWell(
                    onTap: () {
                      Get.to(SalerBookingDetailsScreen(isPending: true,));
                    },
                    child: Container(
                      height: 34.h,
                      width: 115.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: const Color(0xff187949)),
                      child: Center(
                        child: Text(
                          "view details",
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10.h,
      ),
    );
  }
}
