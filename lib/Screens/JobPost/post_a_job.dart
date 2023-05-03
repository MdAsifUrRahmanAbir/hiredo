import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/GoogleMapService/Model/prediction_model.dart';
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

  dynamic catagory = Get.arguments["category"];
  var bookUserId=Get.arguments["isBookId"];
  
  final _homeController = Get.put(HomeController());
  final _jobPostController = Get.put(JobPostController());
  @override
  Widget build(BuildContext context) {
    _jobPostController.isCategoryError.value = false;
    _jobPostController.locationData = null;
    _jobPostController.cateName = [];
    LeadCategoriesModel? catagoryData;
    if (catagory != null) {
      catagoryData = catagory;
    }
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
              catagory != null
                  ? Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 18.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Text(catagoryData!.name),
                    )
                  : Obx(
                      () => DropdownSearch<LeadCategoriesModel>(
                        items: _homeController.subCategoryList,
                        dropdownButtonProps: const DropdownButtonProps(
                          icon: SizedBox(),
                        ),
                        popupProps: const PopupProps.menu(showSearchBox: true),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              labelText: "What service do you need?",
                              hintText:
                                  "e.g. Personal Trainers,House Cleaning ",
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.r),
                                  borderSide: BorderSide(
                                      color: _jobPostController
                                              .isCategoryError.value
                                          ? Colors.red
                                          : const Color(0xFF848484))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(3.r))),
                        ),
                        itemAsString: (LeadCategoriesModel u) => u.name,
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

              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                    controller: _jobPostController.searchTextController,
                    autofocus: false,
                    style:  TextStyle(
                      fontSize: 16.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: "e.g. London",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.r),
                          borderSide:const BorderSide(
                            color:  Color(0xFF848484),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:const BorderSide(
                            color: Colors.blue,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3.r),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.r),
                          borderSide:const BorderSide(
                            color:  Color(0xFF848484),
                            width: 1,
                          ),
                        ))),
                suggestionsCallback: (pattern) async {
                  return await _jobPostController.searchLocation(
                      context, pattern);
                },
                itemBuilder: (context, Prediction suggestion) {
                  return ListTile(
                    leading: const Icon(Icons.location_pin),
                    title: Text(suggestion.description),
                  );
                },
                onSuggestionSelected: (Prediction suggestion)async{
                  _jobPostController.searchTextController.text =
                      suggestion.description;
                      List<Location> locations = await locationFromAddress(suggestion.description);
                      _jobPostController.lat.value=locations.last.latitude;
                      _jobPostController.leng.value=locations.last.longitude;

                      _jobPostController.locationData=LocationDataModel(location:suggestion.description, latitude: _jobPostController.lat.value.toString(), longitude: _jobPostController.leng.value.toString());
                      debugPrint(_jobPostController.lat.value.toString());
                      debugPrint(_jobPostController.leng.value.toString());
                },
              ),

             

              SizedBox(
                height: 50.h,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    if (catagory != null) {
                      LeadCategoriesModel categorieData = catagory;
                      if (_jobPostController.locationData == null) {
                       Get.snackbar("Error", "Please select location");
                      } else if (categorieData.catName.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "data": categorieData.catName,
                          "locationData": _jobPostController.locationData,
                          "bookingUserId":bookUserId
                        };

                        Get.toNamed(Routes.questionScreen, arguments: data);
                      }
                    } else {
                      if (_jobPostController.cateName.isEmpty) {
                        _jobPostController.isCategoryError.value = true;
                      } else if (_jobPostController.locationData == null) {
                         Get.snackbar("Error", "Please select location");
                      } else if (_jobPostController.cateName.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "data": _jobPostController.cateName,
                          "locationData": _jobPostController.locationData,
                          "bookingUserId":bookUserId
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
