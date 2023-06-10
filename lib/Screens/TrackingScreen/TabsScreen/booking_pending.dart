import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SalerBookingDetails/saler_booking_details.dart';
import 'package:homelyknock/Screens/TrackingScreen/Controller/seller_book_now_pending_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/colors.dart';

class BookingPandeingScreen extends StatelessWidget {
   BookingPandeingScreen({super.key});

  final _sellerPendingController=Get.put(SellerBookNowPendingController());

  @override
  Widget build(BuildContext context) {
    _sellerPendingController.getPenddingBookNow();
    return Obx(()=>_sellerPendingController.isLoading.value?
     ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 89.h,
                                  width: 80.w,
                                  color: Colors.white,
                                ),
                                title: Container(
                                  height: 15.h,
                                  width: 100.w,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: double.infinity,
                                  height: 15.h,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  
      :_sellerPendingController.pendingSellerBookNowList.isEmpty? Text("No data available!",style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color:Colors.red)): ListView.separated(
        itemCount: _sellerPendingController.pendingSellerBookNowList.length,
        itemBuilder: (BuildContext context, int index) {
          var data=_sellerPendingController.pendingSellerBookNowList[index];
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
                        child: data.user.userProfilePic==null?Image.asset(
                          'images/ima3.png',
                          height: 89.h,
                          width: 80.w,
                          fit: BoxFit.cover,
                        ):Image.network(
                          data.user.userProfilePic,
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
                          data.user.corporationName,
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
                          data.category.name,
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
                            Expanded(child: Text(data.location,style: GoogleFonts.roboto(fontSize:14.sp,color:const Color(0xFF848484)),maxLines: 1,overflow: TextOverflow.ellipsis,))
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
                        Get.to(SellerBookingDetailsScreen(isPending: true,data:data,));
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
      ),
    );
  }
}
