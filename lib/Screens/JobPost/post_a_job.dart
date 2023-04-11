import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/common_dashboard_services/models/get_location_model.dart';
import 'package:homelyknock/utils/colors.dart';

import '../../widgets/common_dashboard_controller.dart';
import '../HomeScreen/Controller/home_controller.dart';
import '../HomeScreen/Model/lead_category_model.dart';
import '../QuestionScreen/question_screen.dart';
import 'Controller/job_post_controller.dart';

class PostAJob extends StatelessWidget {
  PostAJob({super.key, this.selectIndex});

  int? selectIndex;
  final _homeController = Get.put(HomeController());
  final _jobPostController = Get.put(JobPostController());
  final _commonDashboardController = Get.put(CommonDashboardController());
  @override
  Widget build(BuildContext context) {
    _jobPostController.isCategoryError.value=false;
    _jobPostController.isLocationError.value=false;
    _jobPostController.locationId=null;
    _jobPostController.cateName=[];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          "Create a job post",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              SizedBox(
                height: 205.h,
              ),
              Text("Place a new request",
                  style: GoogleFonts.roboto(
                      fontSize: 25.sp, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 25.h,
              ),
              Obx(
                () => DropdownSearch<LeadCategoriesModel>(
                  items: _homeController.subCategoryList,
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: SizedBox(),
                  ),
                   popupProps:const PopupProps.menu(
                      showSearchBox: true
                    ),
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
                        borderRadius: BorderRadius.circular(3.r)
                      )
                    ),
                  ),
                  itemAsString: (LeadCategoriesModel u) => u.name,
                  selectedItem: selectIndex == null
                      ? null
                      : _homeController.subCategoryList[selectIndex!],
                  onChanged: (value) {
                    selectIndex = 10000000;

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
                () => DropdownSearch<GetLocationModel>(
                  items: _commonDashboardController.locationList,
                  dropdownButtonProps: const DropdownButtonProps(
                    icon: SizedBox(),
                  ),
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
                              color: _jobPostController.isLocationError.value
                                  ? Colors.red
                                  : const Color(0xFF848484))),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.r)
                      )
                    ),
                  ),
                  itemAsString: (GetLocationModel u) => u.name,
                  onChanged: (value) {
                    _jobPostController.locationId = value!.id;
                    debugPrint(_jobPostController.locationId.toString());
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),

              InkWell(
                onTap: () {
                  if (selectIndex != 10000000&&selectIndex!=null) {
                    if (_jobPostController.locationId == null) {
                      _jobPostController.isLocationError.value = true;
                    } else if (_homeController
                        .subCategoryList[selectIndex!].catName.isNotEmpty) {
                      Get.to(QuestionScreen(
                        data: _homeController
                            .subCategoryList[selectIndex!].catName,
                        locationId: 1,
                      ));
                    }
                  } else {
                    if (_jobPostController.cateName.isEmpty) {
                      _jobPostController.isCategoryError.value = true;
                    } else if (_jobPostController.locationId == null) {
                      _jobPostController.isLocationError.value = true;
                    } else if (_jobPostController.cateName.isNotEmpty) {
                      Get.to(QuestionScreen(
                        data: _jobPostController.cateName,
                        locationId: _jobPostController.locationId,
                      ));
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
