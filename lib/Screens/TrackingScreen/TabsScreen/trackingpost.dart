// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';

import 'package:homelyknock/utils/colors.dart';

import 'package:shimmer/shimmer.dart';

import '../Controller/pending_controller.dart';

class TrackingPostOrder extends StatelessWidget {
  TrackingPostOrder({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final _pendingPostontroller = Get.put(PendingController());

  @override
  Widget build(BuildContext context) {
    _pendingPostontroller.getPendingPost(true);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          children: [
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.green)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 120.w,
                      child: Container(
                        padding: EdgeInsets.all(8.0.w),
                        child: TextFormField(
                          controller: nameController,
                          onChanged: (value) {
                            if (nameController.text.isEmpty &&
                                locationController.text.isEmpty) {
                              _pendingPostontroller.pendingPostList.value =
                                  _pendingPostontroller.demoPandingPostList;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Search ",
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Color(0xffB7B7B7)),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 20.w,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 120.w,
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        child: TextFormField(
                          controller: locationController,
                          onChanged: (value) {
                            if (nameController.text.isEmpty &&
                                locationController.text.isEmpty) {
                              _pendingPostontroller.pendingPostList.value =
                                  _pendingPostontroller.demoPandingPostList;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Location",
                            prefix: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.grey,
                                size: 20.sp,
                              ),
                            ),
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Color(0xffB7B7B7)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pendingPostontroller.searchPanddingPost(
                            text: nameController.text.trim(),
                            location: locationController.text.trim());
                      },
                      child: Container(
                        color: Color(0xff187949),
                        height: 50.h,
                        width: 45.w,
                        child: Icon(
                          Icons.search,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => _pendingPostontroller.isLoading.value
                  ? ListView.builder(
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
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _pendingPostontroller.pendingPostList.length,
                      itemBuilder: (context, index) {
                        var result =
                            _pendingPostontroller.pendingPostList[index];
                        return Container(
                          height: 171.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.r),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF187949)
                                        .withOpacity(0.07),
                                    blurRadius: 7,
                                    spreadRadius: 0)
                              ]),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(3.r),
                                      child: Image.network(
                                        result.category.image,
                                        height: 89.h,
                                        width: 80.w,
                                        fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        result.category.name,
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
                                        "${result.responseCount} Company Request",
                                        style: GoogleFonts.roboto(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff848484)),
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
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.orderNamePage,
                                          arguments: result);
                                    },
                                    child: Container(
                                      height: 34.h,
                                      width: 115.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          color: Color(0xff187949)),
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
                                    onTap: () {
                                      _pendingPostontroller
                                          .deletePendingPost(result.id);
                                    },
                                    child: Container(
                                      height: 34.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(
                                              color: themeColorGreen),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                color: Color(0xFF187949)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              //
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => SizedBox(
                        height: 10.h,
                      ),
                    ),
            ),
            _pendingPostontroller.isLoading.value
                ? SizedBox()
                : InkWell(
                    onTap: () {
                      Get.toNamed(Routes.postAJob, arguments:{
                         "isBookId":null,
                                        "category":null
                      });
                    },
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: themeColorGreen,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Add a new job post",
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
