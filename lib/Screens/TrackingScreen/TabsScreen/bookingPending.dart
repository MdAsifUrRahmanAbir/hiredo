import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff272727)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        " Company Request",
                        style: GoogleFonts.roboto(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff848484)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
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
                  SizedBox(
                    width: 24.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 34.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: themeColorGreen),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 20.sp,
                            color: themeColorGreen,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Delete",
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF187949)),
                          ),
                        ],
                      ),
                    ),
                  )
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
