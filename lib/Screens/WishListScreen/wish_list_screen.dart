import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../Route/routes.dart';
import 'Controller/wish_list_controller.dart';

WishListController wishListController = Get.put(WishListController());

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  // final List<Map<String, dynamic>> item = [
  //   {
  //     'image': 'images/servImage.png',
  //     'title': 'Commercial cleaning by expertise',
  //     'subTitle': '200+ Company work'
  //   },
  //   {
  //     'image': 'images/servImage.png',
  //     'title': 'Commercial cleaning by expertise',
  //     'subTitle': '200+ Company work'
  //   },
  //   {
  //     'image': 'images/servImage.png',
  //     'title': 'Commercial cleaning by expertise',
  //     'subTitle': '200+ Company work'
  //   },
  //   {
  //     'image': 'images/servImage.png',
  //     'title': 'Commercial cleaning by expertise',
  //     'subTitle': '200+ Company work'
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    // wishListController.fetchWishListService();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF187949),
              )),
          title: Text(
            'Wishlist',
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF272727)),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0.w),
              child: CircleAvatar(
                radius: 15.r,
                backgroundImage: AssetImage('images/kumar.png'),
              ),
            )
          ],
        ),
        body: Obx(
          (() => wishListController.isLoading.value
              ? CustomLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //<------------------ services ---------------->
                        if (wishListController.serviceWishListModel.isNotEmpty)
                          Text(
                            'Services',
                            style: GoogleFonts.roboto(
                                color: const Color(0xFF272727),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              mainAxisExtent: 260.h,
                            ),
                            itemCount:
                                wishListController.serviceWishListModel.length,
                            itemBuilder: (context, index) {
                              var result = wishListController
                                  .serviceWishListModel[index];
                              return Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            child: Image.network(
                                              result.categoryService.image!,
                                              height: 108.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                              right: 15.w,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite,
                                                    color: Color(0xFF174E31),
                                                  )))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        result.categoryService.name,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF272727)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        " ${result.categoryService.popularity} Company work",
                                        style: GoogleFonts.roboto(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF848484)),
                                      ),
                                      SizedBox(
                                        height: 25.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.postAJob,
                                              arguments: {
                                                "isBookId": null,
                                                "category":
                                                    result.categoryService
                                              });
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 84.w,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF187949),
                                              borderRadius:
                                                  BorderRadius.circular(3.r)),
                                          child: Center(
                                            child: Text(
                                              'Post a Job',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      const Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 25.h,
                        ),
                        if (wishListController.wishlistModel.isNotEmpty)
                          Text('Company',
                              style: GoogleFonts.roboto(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF272727))),
                        SizedBox(
                          height: 25.h,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            var result =
                                wishListController.wishlistModel[index];
                            return Container(
                              height: 230.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF8F8F8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        result
                                            .wishedUser.userProfilePic.picture,
                                        height: 70.h,
                                        width: 100.w,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            result.wishedUser.corporationName,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF272727)),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xFFEACA23),
                                              ),
                                              Text(
                                                '${result.productRatingAvg}',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF424242)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite,
                                            color: Color(0xFF174E31),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 84.w,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF187949),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Center(
                                          child: Text(
                                            'Contact',
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Container(
                                        height: 40.h,
                                        width: 171.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xFF187949)),
                                            borderRadius:
                                                BorderRadius.circular(3.r)),
                                        child: Center(
                                          child: Text(
                                            'View Conpany Profile',
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF424242)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: wishListController.wishlistModel.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(),
                        )
                      ],
                    ),
                  ),
                )),
        ));
  }
}
