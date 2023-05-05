import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/TrackingScreen/Model/pending_book_now_model.dart';
import 'package:jiffy/jiffy.dart';

import '../../utils/colors.dart';
import '../LeadsDetailsScreen/leads_details_screen.dart';

class SellerBookingDetailsScreen extends StatelessWidget {
   SellerBookingDetailsScreen({super.key,required this.isPending, this.data});

  bool isPending;
  PendingBookNowModel? data;
  

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
          leading:CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade400,
                ),
              // : CircleAvatar(
              //     radius: 20.r,
              //     backgroundImage: NetworkImage(
              //         "$baseUrl${leadData.user.userProfilePic!.picture}"),
              //   ),
          title: Text(
           data!.user.corporationName,
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
        ),
      ),
    
      body: SafeArea(child:SingleChildScrollView(
        
        child: Column(
          children: [
            SizedBox(height:10.h,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal:17.w),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFFAFAFA),
                                          borderRadius: BorderRadius.circular(3.r)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  data!.category.name,
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
                                                    borderRadius:
                                                        BorderRadius.circular(5.r)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                      
                                                      Jiffy.parse(data!.created)
                                                          .fromNow(),
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w400,
                                                          color: const Color(
                                                              0xFF187949)),
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
                                                data!.location,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14.sp,
                                                    color: const Color(0xFF424242)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                     Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color:const Color(0xFF187949),
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                         data!.user.phoneNumber,
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF272727)),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        // Container(
                                        //   height: 12.h,
                                        //   width: 40.w,
                                        //   decoration: BoxDecoration(
                                        //       color: const Color(0xFFE8FAF1),
                                        //       borderRadius:
                                        //           BorderRadius.circular(3.r)),
                                        //   child: Row(
                                        //     children: [
                                        //       Image.asset(
                                        //         'images/righttick.png',
                                        //       ),
                                        //       SizedBox(
                                        //         width: 2.w,
                                        //       ),
                                        //       Text(
                                        //         'verified',
                                        //         style: GoogleFonts.roboto(
                                        //             fontSize: 8.sp,
                                        //             fontWeight: FontWeight.w400,
                                        //             color: const Color(0xFF187949)),
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      
                                      
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: const Color(0xFF187949),
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        
                                           Text(
                                            data!.user.email,
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
                                  if(isPending)
                                    Row(
                                      children: [
                                        Container(
                                            height: 40.h,
                                            width: 140.w,
                                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF187949),
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: Center(
                                              child: Text(
                                                'Accept',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(0xFFFFFFFF)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width:25.w,),
                                            Container(
                                          height: 40.h,
                                          width: 140.w,
                                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color(0xFF187949)),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Center(
                                            child: Text(
                                              'Reject',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  
                                                  color: const Color(0xFF187949)),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        
                                       
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
                                      color:
                                          const Color(0xFF848484).withOpacity(0.05),
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
                                         final qansData = data!.realtimePostObject[index];
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                      itemCount:data!.realtimePostObject.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
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
                        child: GoogleMapsShow(lat:data!.latitude,leng:data!.longitude,),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                            
                             
                             
           
          ],
        ),
      )),
    );
  }
}