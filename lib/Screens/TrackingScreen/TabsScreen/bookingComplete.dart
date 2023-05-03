import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingCompleteScreen extends StatelessWidget {
  const BookingCompleteScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Designing My New Website',
                                style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF555957)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Completed by ',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF848484)),
                                children: [
                                  TextSpan(
                                      text: 'HBO Work',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF272727))),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ]));
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 10.h,
      ),
    );
  }
}
