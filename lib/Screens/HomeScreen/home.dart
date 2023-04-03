// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Screens/CategoriesScreen/categories.dart';
import 'package:myapp/Screens/HomeScreen/Controller/home_controller.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';

import 'package:myapp/Screens/LocationScreen/locationpage.dart';
import 'package:myapp/widgets/custom_loader.dart';

import '../FeturedService/fetured_service.dart';
import 'Model/lead_category_model.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        //  appBar: _appBarWidget(),
        body: Obx(() => _homeController.isLoading.value
            ? CustomLoader()
            : _bodyWidget(context)),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 23.h,
        ),
        //<------------- discover text line------------>
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: GoogleFonts.roboto(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: Color(0xff2E2E2E)),
              ),
              Text(
                "Find the best one",
                style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    color: Color(0xff2E2E2E)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),

//<------------- Search Box ------------>

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>  SearchResult(),));
          },
          child: Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 17.w),
           
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF9CCDB5), width: 1),
                borderRadius: BorderRadius.circular(4.r)),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Search",
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp, color: Color(0xffB7B7B7)),
                        )),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 0.5.w,
                                height: double.infinity,
                                color: Color(0xFF9CCDB5),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Icon(
                                Icons.location_pin,
                                size: 18.sp,
                                color: Color(0xFFB7B7B7),
                              ),
                              Text(
                                "Location",
                                style: GoogleFonts.roboto(
                                    fontSize: 16.sp, color: Color(0xffB7B7B7)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 45.w,
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFF187949),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3.r),
                          bottomRight: Radius.circular(3.r)))
                          ,
                         child:  Icon(
                          Icons.search,
                           color: Color(0xffFFFFFF)),
                )
              ],
            ),
          ),
        ),

        // Padding(
        //   padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 32.h),
        //   child: IntrinsicHeight(
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(4.r),
        //           border: Border.all(color: Colors.green)),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             height: 50.h,
        //             width: 120.w,
        //             child: Container(
        //               padding: EdgeInsets.all(8.0.w),
        //               child: TextFormField(
        //                 onTap: () {
        //                   print('click');
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (_) => SearchResult()));
        //                 },
        //                 controller: _homeController.nameController,
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   fillColor: Colors.white,
        //                   hintText: "Search ",
        //                   hintStyle: GoogleFonts.roboto(
        //                       fontSize: 16.sp,
        //                       fontWeight: FontWeight.w400,
        //                       letterSpacing: 1,
        //                       color: Color(0xffB7B7B7)),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           VerticalDivider(
        //             width: 20.w,
        //             thickness: 1,
        //             indent: 10,
        //             endIndent: 10,
        //             color: Colors.grey,
        //           ),
        //           SizedBox(
        //             height: 50.h,
        //             width: 120.w,
        //             child: Container(
        //               padding: EdgeInsets.all(5.w),
        //               child: TextFormField(
        //                 onTap: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (_) => LocationPage()));
        //                 },
        //                 controller: _homeController.locationController,
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   fillColor: Colors.white,
        //                   hintText: "Location",
        //                   prefix: InkWell(
        //                     onTap: () {},
        //                     child: Icon(
        //                       Icons.location_pin,
        //                       color: Colors.grey,
        //                       size: 20.sp,
        //                     ),
        //                   ),
        //                   hintStyle: GoogleFonts.roboto(
        //                       fontSize: 16.sp,
        //                       fontWeight: FontWeight.w400,
        //                       letterSpacing: 1,
        //                       color: Color(0xffB7B7B7)),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () {},
        //             child: Container(
        //               color: Color(0xff187949),
        //               height: 50.h,
        //               width: 45.w,
        //               child: Icon(
        //                 Icons.search,
        //                 color: Color(0xffFFFFFF),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),

        SizedBox(
          height: 31.h,
        ),

        SizedBox(
          height: 147.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 147.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.2,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (value, resaion) {
                      _homeController.dotPosition.value = value;
                    }),
                items: _homeController.carouselImages.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(i), fit: BoxFit.cover)),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 9.h,
                child: DotsIndicator(
                  dotsCount: _homeController.carouselImages.length,
                  position: _homeController.dotPosition.value.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Color(0xff187949),
                    color: const Color(0xff174e314d).withOpacity(0.3),
                    spacing: EdgeInsets.all(2),
                    activeSize: Size(8, 8),
                    size: Size(8, 8),
                  ),
                ),
              ),
            ],
          ),
        ),

//<-------------Our Categories------------>

        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Categories",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff555957),
                    letterSpacing: 1),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CategoriesPage(
                                allCategories: _homeController.categoryList,
                              )));
                },
                child: Text(
                  "See All",
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff187949),
                      letterSpacing: 1),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 120.h,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _homeController.categoryList.length > 10
                  ? 10
                  : _homeController.categoryList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var result = _homeController.categoryList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        result.image == null
                            ? CircleAvatar(
                                backgroundColor: Color(0xffD9F1E5),
                                radius: 25.r,
                                child: Icon(
                                  Icons.face,
                                  color: Colors.grey,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(result.image!),
                              ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          result.name,
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555957),
                              letterSpacing: 1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),

        //<------------- Fetured Service   ------------>

        Padding(
          padding:
              EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fetured Service",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff555957),
                    letterSpacing: 1),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FeturedServiceScreen(
                              data: _homeController.subCategoryList)));
                },
                child: Text(
                  "See All",
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff187949),
                      letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          physics: NeverScrollableScrollPhysics(),
          itemCount: _homeController.subCategoryList.length > 2
              ? 2
              : _homeController.subCategoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 231.h,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              crossAxisCount: 2),
          itemBuilder: (context, index) =>
              itemContainer(_homeController.subCategoryList[index]),
        ),
      ],
    );
  }

  itemContainer(LeadCategoriesModel data) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 1))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 114.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.network(
                    data.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 10.w,
                  top: 10.h,
                  child: Icon(
                    Icons.favorite_border,
                    color: Color(0xFF187949),
                  ))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(data.name,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color: Color(0xFF272727),
                fontWeight: FontWeight.w400,
              )),
          SizedBox(
            height: 5.h,
          ),
          // Text(
          //   '200+ Company work',
          //   style: GoogleFonts.roboto(
          //       fontSize: 10.sp,
          //       fontWeight: FontWeight.w400,
          //       color: Color(0xFF848484)),
          // ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 30.h,
            width: 84.w,
            decoration: BoxDecoration(
                color: Color(0xFF187949),
                borderRadius: BorderRadius.circular(5.r)),
            child: Center(
              child: Text(
                'Post a Job',
                style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          )
        ],
      ),
    );
  }



}
