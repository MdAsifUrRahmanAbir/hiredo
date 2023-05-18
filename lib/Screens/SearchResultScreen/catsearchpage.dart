// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../HomeScreen/Controller/home_controller.dart';
import '../JobPost/Model/location_model.dart';
import 'search_controller.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final controller = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>controller.isInitLocationLoading.value?CustomLoader():
           SingleChildScrollView(
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
      ),
    );
  }

  _searchCategoriesBodyWidget() {
    return Card(
      
      child: Column(
        children: [
          _categoriesBodyTopTitleWidget(),
          Obx(
            () => controller.isTopCatSearchScreen.value
                ? _gridViewCategoryWidget()
                : _gridViewLocationWidget(),
          ),
          SizedBox(height:15.h,)
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
    return Obx(()=>controller.predictionList.isEmpty?
    GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:controller.locationList.length>=5?5:controller.locationList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (_, index) {
            var data =controller.locationList[index];
            return GestureDetector(
              onTap: () async {
                List<Location> locations =
                    await locationFromAddress(data.city);
                var lat = locations.last.latitude;
    
                var long = locations.last.longitude;
    
            controller.locationData=    LocationDataModel(location: data.city, latitude:lat.toString(), longitude:long.toString());
    
                controller.selectedLocationIndex.value = index;
                if (controller.selectCategory != null) {
                    if(controller.selectCategory!.catName.isNotEmpty){
                    controller.goToPostJobScreen();
                  }else{
                    controller.isTopCatSearchScreen.value = true;
                  }
                  
                } else {
                  controller.isTopCatSearchScreen.value = true;
                }
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w, top: 5.h),
                child: Card(
                  child: Obx(() => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color:
                                  controller.selectedLocationIndex.value == index
                                      ? Color(0xff9CCDB5)
                                      : Color(0xffffffff),
                            )),
                        child: ListTile(
                          title: Text(
                            data.city,
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
          })
     :controller.isLoading.value?CustomLoader():
       GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:controller.predictionList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (_, index) {
            var data =controller.predictionList[index];
            return GestureDetector(
              onTap: () async {
                List<Location> locations =
                    await locationFromAddress(data.description);
                var lat = locations.last.latitude;
    
                var long = locations.last.longitude;
    
            controller.locationData=    LocationDataModel(location: data.description, latitude:lat.toString(), longitude:long.toString());
    
                controller.selectedLocationIndex.value = index;
                if (controller.selectCategory != null) {

                  if(controller.selectCategory!.catName.isNotEmpty){
                    controller.goToPostJobScreen();
                  }else{
                    controller.isTopCatSearchScreen.value = true;
                  }
                  
                } else {
                  controller.isTopCatSearchScreen.value = true;
                }
              },
              child: Container(
                padding:
                    EdgeInsets.only(left: 5.w, right: 5.w, bottom: 5.w, top: 5.h),
                child: Card(
                  child: Obx(() => Container(
                    
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color:
                                  controller.selectedLocationIndex.value == index
                                      ? Color(0xff9CCDB5)
                                      : Color(0xffffffff),
                            )),
                            
                        child: ListTile(

                          title: Text(
                            data.description,
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
          }),
    
    
    );
  }

  _gridViewCategoryWidget() {
    return  
       GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.subcategory.length >= 8
              ? 8
              : controller.subcategory.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (_, index) {
            var data = controller.subcategory[index];
    
            return GestureDetector(
              onTap: () {
                controller.selectedCategoryIndex.value = index;
                controller.selectCategory = data;
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
                              color:
                                  controller.selectedCategoryIndex.value == index
                                      ? Color(0xff9CCDB5)
                                      : Color(0xffffffff),
                            )),
                        child: ListTile(
                          title: Text(
                            data.name,
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
        controller.searchSubCategory(controller.categoryController.text);
        controller.searchLocation(controller.locationController.text);
      },
      child: Container(
        color: Color(0xff187949),
        height: double.infinity,
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
      //readOnly: true,
      onChanged: (value) {
        if (value.isEmpty) {
          controller.subcategory.value = homeController.subCategoryList;
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
      //  readOnly: true,
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
