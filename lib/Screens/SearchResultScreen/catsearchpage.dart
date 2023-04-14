// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../widgets/common_dashboard_controller.dart';
import '../HomeScreen/Controller/home_controller.dart';
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
              _searchTextFieldWidget(),
              SizedBox(
                height: 25.h,
              ),

              _searchCategoriesBodyWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _searchCategoriesBodyWidget() {
    return Card(
      child: Column(
        children: [
          _categoriesBodyTopTitleWidget(),
          Obx(() => controller.isTopCatSearchScreen.value
              ? _gridViewCategoryWidget()
              : _gridViewLocationWidget(),)
        ],
      ),
    );
  }

  _categoriesBodyTopTitleWidget() {
    return Obx(() => ListTile(
          trailing: Radio<String>(
            activeColor: Color(0xff187949),
            value: controller.isTopCatSearchScreen.value
                ? 'Top Categories'
                : 'Locations',
            groupValue: "",
            onChanged: (value) {},
          ),
          leading: Text(
              controller.isTopCatSearchScreen.value
                  ? 'Top Categories'
                  : 'Locations',
              style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff272727))),
        ));
  }

  _gridViewLocationWidget() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: commonController.locationList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.3,
        ),
        itemBuilder: (_, index) {

          return GestureDetector(
            onTap: () {
              controller.isTopCatSearchScreen.value = true;
              controller.selectedLocationIndex.value = index;

              controller.goToPostJobScreen();
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w, top: 5.h),
              child: Card(
                child: Obx(() => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: controller.selectedLocationIndex.value == index
                                ? Color(0xff9CCDB5)
                                : Color(0xffffffff),
                          )),
                      child: ListTile(
                            leading: Text(
                              commonController.locationList[index].name,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff272727)),
                            ),
                            trailing: Icon(
                              controller.isTopCatSearchScreen.value
                                  ? Icons.fingerprint
                                  : Icons.location_on_outlined,
                              color: Color(0xff187949),
                            ),
                          ),
                    )),
              ),
            ),
          );
        });
  }

  _gridViewCategoryWidget() {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeController.subCategoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.3,
        ),
        itemBuilder: (_, index) {

          return GestureDetector(
            onTap: () {
              controller.selectedCategoryIndex.value = index;
              controller.isTopCatSearchScreen.value = false;
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w, top: 5.h),
              child: Card(
                child: Obx(() => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: controller.selectedCategoryIndex.value == index
                                ? Color(0xff9CCDB5)
                                : Color(0xffffffff),
                          )),
                      child: ListTile(
                            leading: Text(
                              homeController.subCategoryList[index].name,
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff272727)),
                            ),
                            trailing: Icon(
                                Icons.fingerprint,
                              color: Color(0xff187949),
                            ),
                          ),
                    )),
              ),
            ),
          );
        });
  }

  _searchTextFieldWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: Colors.green)),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _categoriesTextFieldWidget()),
            verticalDividerWidget(),
            Expanded(child: _locationTextFieldWidget()),
            _searchButtonWidget()
          ],
        ),
      ),
    );
  }

  verticalDividerWidget() {
    return VerticalDivider(
      width: 20.w,
      thickness: 1,
      indent: 10,
      endIndent: 10,
      color: Colors.grey,
    );
  }

  _searchButtonWidget() {
    return GestureDetector(
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
    );
  }

  _categoriesTextFieldWidget() {
    return TextFormField(
      controller: controller.categoryController,
      onTap: () {
        controller.isTopCatSearchScreen.value = true;
      },
      readOnly: true,
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
          )),
    );
  }

  _locationTextFieldWidget() {
    return TextFormField(
      controller: controller.locationController,
      onTap: () {
        controller.isTopCatSearchScreen.value = false;
      },
      readOnly: true,
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
    );
  }
}
