import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../Route/routes.dart';
import 'Controller/wish_list_controller.dart';

WishListController wishListController = Get.put(WishListController());

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    wishListController.fetchWishListService();
    return Scaffold(
        backgroundColor: Colors.white,
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
                color: const Color(0xFF272727)),
          ),
          centerTitle: true,
        ),
        body: Obx(
          (() => wishListController.isLoading.value
              ? const CustomLoader()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 26.w,
                    ),
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
                        if (wishListController.serviceWishListModel.isNotEmpty)
                          SizedBox(
                            height: 20.h,
                          ),
                        if (wishListController.serviceWishListModel.isNotEmpty)
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
                              itemCount: wishListController
                                  .serviceWishListModel.length,
                              itemBuilder: (context, index) {
                                var result = wishListController
                                    .serviceWishListModel[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 17,
                                            color: Color(0xFF000000)
                                                .withOpacity(0.07))
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                                    color: const Color(
                                                        0xFFFFFFFF)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),

                        if (wishListController.wishlistModel.isNotEmpty)
                          SizedBox(
                            height: 25.h,
                          ),
                        if (wishListController.wishlistModel.isNotEmpty)
                          Text('Company',
                              style: GoogleFonts.roboto(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF272727))),
                        if (wishListController.wishlistModel.isNotEmpty)
                          SizedBox(
                            height: 25.h,
                          ),
                        if (wishListController.wishlistModel.isNotEmpty)
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var result =
                                  wishListController.wishlistModel[index];
                              return Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 23.w, vertical: 25.h),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        result.wishedUser.userProfilePic == null
                                            ? Container(
                                                height: 100.h,
                                                width: 100.h,
                                                color: Colors.grey.shade300,
                                              )
                                            : Image.network(
                                                result.wishedUser.userProfilePic
                                                    .picture,
                                                height: 100.h,
                                                width: 100.h,
                                                fit: BoxFit.fill,
                                              ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                result
                                                    .wishedUser.corporationName,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: const Color(
                                                        0xFF272727)),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        const Color(0xFFEACA23),
                                                    size: 25.sp,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    '${result.productRatingAvg}',
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: const Color(
                                                            0xFF424242)),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
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
                                                  color:
                                                      const Color(0xFFFFFFFF)),
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
                                                  color:
                                                      const Color(0xFF424242)),
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
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(),
                          )
                      ],
                    ),
                  ),
                )),
        ));
  }
}
