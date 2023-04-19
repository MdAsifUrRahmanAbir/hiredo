import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_widgets.dart';

import 'controller_complete_post.dart';

class CompletePostDetails extends StatelessWidget {
  CompletePostDetails({
    super.key,
  });

  final _completeController = Get.put(CompletePostDetailsController());

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
          "Complete Post Details",
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
                        // image:
                        //     DecorationImage(image: NetworkImage(""),fit: BoxFit.fill)
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "data.category.name",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Text(
                      "Jakir Hossin",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: const Color(0xFFEACA23),
                          size: 25.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          '4.9',
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF424242)),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text('Total 500 work complete',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF424242))),

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
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => _reviewDialog());
                          },
                          child: Container(
                            height: 50.h,
                            width: 148.w,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF187949)),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Center(
                              child: Text(
                                'Review',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF187949)),
                              ),
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
                          "20 Credits",
                          //  "${leadData.postCredit} Credits",
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
                        //final qansData = leadData.postObject[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "qansData.question.qs",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "  qansData.pAnswer.options",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                          ],
                        );
                      },
                      itemCount: 0,
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
                      target: LatLng(
                          double.parse("0.255555"), double.parse("0.8888888"))),
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

 _reviewDialog() {
    return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 0,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.w),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 25.sp,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        CustomTextFieldForm(
                                          controller: _completeController
                                              .desTextController,
                                          hintText: "Description",
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 50.h,
                                            width: 150.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: themeColorGreen,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.r)),
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
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
