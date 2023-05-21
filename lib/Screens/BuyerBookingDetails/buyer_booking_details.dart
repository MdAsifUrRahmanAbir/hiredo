// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../GoogleMapService/google_map_show.dart';
import '../TrackingScreen/Model/pending_book_now_model.dart';


class BuyerBookNowDetails extends StatelessWidget {
   BuyerBookNowDetails({super.key ,required this.data});

  PendingBookNowModel data;

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xff187949),
            )),
        title: Text(
          "Booking details",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
      
        
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                SizedBox(
                    height: 10,
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
                        color: Color(0xFF272727)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(data.location,style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF555957)),),
                  // RichText(
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 2,
                  //               text: TextSpan(
                  //                 text: '',
                  //                 style:GoogleFonts.roboto(
                  //       fontSize: 14.sp,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xFF555957)),
                  //                 children: data.realtimePostObject
                  //                     .map((e) => TextSpan(
                  //                         text: e.question.qs,
                  //                         style:GoogleFonts.roboto(
                  //       fontSize: 14.sp,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xFF555957))))
                  //                     .toList(),
                  //               )),
                
                  
                  
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      //  height: 147.h,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 15.h, left: 5.w,bottom:15.h),
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            data.bookedInUser.userProfilePic==null?
                            CircleAvatar(
                              radius: 25.h,
                              backgroundColor: Colors.grey.shade400,
                            ): CircleAvatar(
                              radius: 25.h,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(data.bookedInUser.userProfilePic),
                            ),
                            SizedBox(width:10.w,),
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
                                        color: Color(0xFF272727)),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                   Text(
                                  data.bookedInUser.email,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        
                                        color: Color(0xFF424242)),
                                  ),
                                   Text(
                                     data.bookedInUser.phoneNumber,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                       
                                        color: Color(0xFF424242)),
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
                     SizedBox(
                  height: 200.h,
                  child: GoogleMapsShow(
                    lat: data.latitude,
                    leng: data.latitude,
                  )),
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
}
