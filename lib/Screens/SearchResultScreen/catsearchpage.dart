// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'search_controller.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final controller = Get.put(SearchController());





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            children: [

              // <------------------- search Screen---------------->
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.green)),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller.categoryController,
                          onTap: (){
                            controller.isTopCatSearchScreen.value = true;
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
                              prefix: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.category,
                                  color: Colors.grey,
                                  size: 20.sp,
                                ),
                              )
                          ),
                        )
                      ),
                      VerticalDivider(
                        width: 20.w,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.locationController,
                          onTap: (){
                            controller.isTopCatSearchScreen.value = false;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Location",
                            prefix: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.location_on,
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
                        )
                      ),
                      GestureDetector(
                        onTap: () {

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
                height: 25.h,
              ),

              Card(
                child: Column(
                  children: [
                    Obx(() => ListTile(
                      trailing: Radio<String>(
                        activeColor: Color(0xff187949),
                        value: controller.isTopCatSearchScreen.value
                            ? 'Top Categories'
                            : 'Locations'
                        ,
                        groupValue: "",
                        onChanged: (value) {

                        },
                      ),
                      leading: Text(controller.isTopCatSearchScreen.value
                          ? 'Top Categories'
                          : 'Locations',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff272727))),
                    )),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.3,
                        ),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: (){
                              controller.selectedIndex.value = index;
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  bottom: 5.w,
                                  top: 5.h),
                              child: Card(
                                child: Obx(() => Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(4.r),
                                      border: Border.all(
                                        color: controller.selectedIndex.value == index
                                            ? Color(0xff9CCDB5)
                                            : Color(0xffffffff),
                                      )),
                                  child: Obx(() => ListTile(
                                    leading: Text(
                                      controller.isTopCatSearchScreen.value
                                          ? 'Top Category $index'
                                          : 'Locations $index',
                                      style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    trailing: Icon(
                                      controller.isTopCatSearchScreen.value
                                          ? Icons.fingerprint
                                          : Icons.location_on_outlined,
                                      color: Color(0xff187949),
                                    ),
                                  )),
                                )),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
