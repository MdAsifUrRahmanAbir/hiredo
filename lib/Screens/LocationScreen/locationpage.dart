// ignore_for_file: prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'location_controller.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(
            children: [
              SizedBox(
                height: 44.h,
              ),
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
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
                            controller: _locationController.searchCtrl,
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
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: _locationController.locationSearchCtrl,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintText: "Location",
                              prefix: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                  size: 20,
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
                        onTap: () {},
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
                height: 10.h,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (contex, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 90.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.r),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      color: Color(0xFF000000).withOpacity(0.1),
                                      offset: Offset(0, 2))
                                ]),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.location_pin,
                                              size: 20.sp,
                                              color: Color(0xFF848484),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Within 50 miles of East York",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.r),
                                                color: Color(0xff187949),
                                              ),
                                              height: 26.h,
                                              width: 83.w,
                                              alignment: Alignment.center,
                                              child: Text("View on Map",
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          Color(0xffFFFFFF))),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color:
                                                          Color(0xff187949))),
                                              width: 67.w,
                                              height: 26.h,
                                              alignment: Alignment.center,
                                              child: Center(
                                                  child: Text("Remove",
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff187949)))),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0xFF848484),
                                    size: 25.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          if (index == 9)
                            TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      isDismissible: true,
                                      backgroundColor: Colors.white,
                                      shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.r),
                                              topRight: Radius.circular(15.r))),
                                      builder: (context) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Text(
                                                "Add Location",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              DropdownSearch(
                                                popupProps: PopupProps.dialog(
                                                  showSelectedItems: false,
                                                  showSearchBox: true,
                                                ),
                                                items: _locationController
                                                    .country
                                                    .map((e) => e)
                                                    .toList(),
                                                onChanged: (value) {},
                                                selectedItem: "",
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              TextFormField(
                                                controller: _locationController
                                                    .distanceController,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText:
                                                      'Add Location Distance',
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 0.5)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 0.5)),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black,
                                                          width: 0)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 50.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF187949),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Submit',
                                                        style: GoogleFonts.roboto(
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: const Color(
                                                                0xFFFFFFFF)),
                                                      ),
                                                      // Obx(() => SizedBox(
                                                      //       width: updatLeadController
                                                      //               .isLoading.value
                                                      //           ? 5.w
                                                      //           : 0,
                                                      //     )),
                                                      // Obx(() {
                                                      //   if (updatLeadController.isLoading.value) {
                                                      //     return SizedBox(
                                                      //       height: 10.h,
                                                      //       width: 10.w,
                                                      //       child:
                                                      //           const CircularProgressIndicator(
                                                      //         color: Colors.white,
                                                      //       ),
                                                      //     );
                                                      // } else {
                                                      //   return const SizedBox();
                                                      // }
                                                      //    })
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "+ Add a location",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      color: Color(0xFF187949),
                                      fontWeight: FontWeight.w600),
                                ))
                        ],
                      ),
                  separatorBuilder: (_, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: 10),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
