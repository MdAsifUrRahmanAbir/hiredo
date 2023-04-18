
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:jiffy/jiffy.dart';

import '../LeadsScreen/Model/leads_model.dart';
import 'Controller/lead_details_controller.dart';

class LeadsDetailsScreen extends StatelessWidget {
  LeadsDetailsScreen({
    super.key,
  });

  Result leadData = Get.arguments;

   final   _leadDetailsController=Get.put(LeadDetailsController());

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
                child: Obx(()=>
                   Column(
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
                            color:const Color(0xFF187949),
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
                          InkWell(
                            onTap: () {
                              if(!_leadDetailsController.isContect.contains(leadData.id)){
                                   _leadDetailsController.handleContact(leadData.id);
                              }
                            
                            },
                            child: Container(
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
                      if(_leadDetailsController.isContect.contains(leadData.id))
                      _contactVisiable(context),
                
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
              ),
              SizedBox(
                height: 200.h,
                child: GoogleMap(
                  rotateGesturesEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  liteModeEnabled: false,
                  tiltGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(double.parse(leadData.latitude ?? "0.0"),
                          double.parse(leadData.latitude ?? "0.0"))),
                  onMapCreated: (GoogleMapController controller) {},
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _contactVisiable(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        title: Text(
                          "Give them a call",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          "Connect with the customer now to discuss their project directly",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        leading: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: const Color(0xFFF3F3F6),
                            child: Icon(
                              Icons.call,
                              size: 25.sp,
                            )),
                        trailing: InkWell(
                          onTap: () {
                            showNumber(context);
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: themeColorGreen),
                            child: Text(
                              "Show Number",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp, color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      )
                   ,
                    ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0,
                        minVerticalPadding: 0,
                        title: Text(
                          "Send an email",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          "Send a template or custom eamil to introduce yourself",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.grey),
                        ),
                        leading: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: const Color(0xFFF3F3F6),
                            child: Icon(
                              Icons.check,
                              size: 25.sp,
                            )),
                        trailing: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                
                              },
                              child: Container(
                                height: 40.h,
                                width: 120.w,
                                padding: EdgeInsets.symmetric(horizontal:2.w,vertical:2.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: themeColorGreen),
                                child: Text(
                                  "Use email template",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            SizedBox(height:5.h,),
                          
                            Text("Send a custom email",style:GoogleFonts.roboto(fontSize:16.sp,fontWeight:FontWeight.w500,decoration: TextDecoration.underline),),
                          
                          
                          
                          ],
                        ),
                      )
                   
                   
                   
                   
                    ],
                  );
  }

 showNumber(BuildContext context) {
    return showDialog(
                              barrierDismissible: false,
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              const Spacer(),
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: CircleAvatar(
                                                  radius: 20.r,
                                                  backgroundColor:
                                                      const Color(0xFFF3F3F6),
                                                  child: Icon(
                                                    Icons.close,
                                                    size: 15.r,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          ListTile(
                                            dense: true,
                                            contentPadding: EdgeInsets.zero,
                                            minLeadingWidth: 0,
                                            minVerticalPadding: 0,
                                            title: Text(
                                              leadData.user.fullName,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              leadData.user.phoneNumber,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                            trailing: Container(
                                              height: 50.h,
                                              width: 50.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  color: themeColorGreen),
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.white,
                                                size: 25.h,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ));
  }

 

  customeText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF424242)),
    );
  }
}
