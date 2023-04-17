import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/JobPost/Model/location_model.dart';

import 'package:homelyknock/utils/colors.dart';

import '../HomeScreen/Controller/home_controller.dart';
import '../HomeScreen/Model/lead_category_model.dart';

import 'Controller/job_post_controller.dart';

class PostAJob extends StatelessWidget {
  PostAJob({
    super.key,
  });

  dynamic selectIndex = Get.arguments;
  final _homeController = Get.put(HomeController());
  final _jobPostController = Get.put(JobPostController());
  @override
  Widget build(BuildContext context) {
    _jobPostController.isCategoryError.value = false;
    _jobPostController.isLocationError.value = false;
    _jobPostController.locationData = null;
    _jobPostController.cateName = [];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: themeColorGreen),
        centerTitle: true,
        title: Text(
          "Order",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Place a new request",
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 8.h,
              ),
              Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint",
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF424242))),

              SizedBox(
                height: 25.h,
              ),
              Obx(
                () => DropdownSearch<LeadCategoriesModel>(
                  items: _homeController.subCategoryList,
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: SizedBox(),
                  ),
                  enabled: selectIndex == null ? true : false,
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "What service do you need?",
                        hintText: "e.g. Personal Trainers,House Cleaning ",
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.r),
                            borderSide: BorderSide(
                                color: _jobPostController.isCategoryError.value
                                    ? Colors.red
                                    : const Color(0xFF848484))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.r))),
                  ),
                  itemAsString: (LeadCategoriesModel u) => u.name,
                  selectedItem: selectIndex == null
                      ? null
                      : _homeController.subCategoryList[selectIndex!],
                  onChanged: (value) {
                    _jobPostController.cateName = value!.catName;
                    debugPrint(value.catName.length.toString());
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),

              // location
              Obx(
                () => DropdownSearch<LocationDataModel>(
                  items: _jobPostController.locationList,
                  popupProps: const PopupProps.menu(showSearchBox: true),
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: SizedBox(),
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "What is the location?",
                        hintText: "e.g. London",
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.r),
                            borderSide: BorderSide(
                                color: _jobPostController.isLocationError.value
                                    ? Colors.red
                                    : const Color(0xFF848484))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.r))),
                  ),
                  itemAsString: (LocationDataModel u) => u.location,
                  onChanged: (value) {
                    _jobPostController.locationData = value!;
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    if (selectIndex != null) {
                      if (_jobPostController.locationData == null) {
                        _jobPostController.isLocationError.value = true;
                      } else if (_homeController
                          .subCategoryList[selectIndex!].catName.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "data": _homeController
                              .subCategoryList[selectIndex!].catName,
                          "locationData": _jobPostController.locationData
                        };

                        Get.toNamed(Routes.questionScreen, arguments: data);
                      }
                    } else {
                      if (_jobPostController.cateName.isEmpty) {
                        _jobPostController.isCategoryError.value = true;
                      } else if (_jobPostController.locationData == null) {
                        _jobPostController.isLocationError.value = true;
                      } else if (_jobPostController.cateName.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "data": _jobPostController.cateName,
                          "locationData": _jobPostController.locationData
                        };
                        Get.toNamed(Routes.questionScreen, arguments: data);
                      }
                    }
                  },
                  child: Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: themeColorGreen,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
