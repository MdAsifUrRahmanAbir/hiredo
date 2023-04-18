import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/ReviewScreen/controller/review_controller.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../SettingsScreen/setting_page.dart';

class ReviewsPage extends StatelessWidget {
  ReviewsPage({Key? key}) : super(key: key);

  final _reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
     _reviewController.fetchReview();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Reviews',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Obx(
        () => _reviewController.isLoading.value
            ? const CustomLoader()
            : Container(
                padding: EdgeInsets.all(15.w),
                height: double.infinity,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffC3F6D7),
                        ),
                        child: Text(
                          "${_reviewController.reviewData!.avgRating}",
                          style: myStyle(20.sp, FontWeight.w700,
                              const Color.fromARGB(255, 154, 89, 89)),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      RatingBar.builder(
                        initialRating:
                            _reviewController.reviewData!.avgRating.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.w),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 25.sp,
                        onRatingUpdate: (rating) {},
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Row(
                        children: [
                          Text(
                            'Overall Rating',
                            style: myStyle(20.sp, FontWeight.w500, textClr),
                          ),
                          const Spacer(),
                          Text(
                            "${_reviewController.reviewData!.avgRating}",
                            style: myStyle(20.sp, FontWeight.w500, textClr),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          // Text(
                          //   '(500)',
                          //   style: myStyle(
                          //       14.sp, FontWeight.w300, const Color(0xff848484)),
                          // ),
                          const Spacer(),
                          Container(
                            width: 95,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: const Color(0xff187949)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Filter',
                                  style: myStyle(
                                      16.sp, FontWeight.w400, scaffoldClr),
                                ),
                                SizedBox(
                                  width: 5.r,
                                ),
                                Icon(
                                  Icons.filter_list_sharp,
                                  color: scaffoldClr,
                                  size: 18.sp,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Flexible(
                          child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var result = _reviewController
                                    .reviewData!.result.reviewsReceived![index];
                                return Container(
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF8F8F8),
                                      borderRadius: BorderRadius.circular(3.r)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      result.reviewedBy.userProfilePic == null
                                          ? CircleAvatar(
                                              radius: 22.r,
                                              backgroundColor:
                                                  Colors.grey.shade400,
                                            )
                                          : CircleAvatar(
                                              radius: 22.r,
                                              backgroundImage: NetworkImage(
                                                  result
                                                      .reviewedBy
                                                      .userProfilePic!
                                                      .picture)),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  result.reviewedBy.fullName,
                                                  style: myStyle(18.sp,
                                                      FontWeight.w500, textClr),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "3 day ago",
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.w400,
                                                      Colors.black),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating:
                                                      result.rating.toDouble(),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  ignoreGestures: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1.w),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemSize: 15.sp,
                                                  onRatingUpdate: (rating) {},
                                                ),
                                                Text(
                                                  result.rating.toString(),
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14.sp,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  result.comment,
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.w400,
                                                      const Color(0xff848484)),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10.h,
                                  ),
                              itemCount:
                                  _reviewController.isSeeAll.value == true ||
                                          _reviewController.reviewData!.result
                                                  .reviewsReceived!.length <
                                              10
                                      ? _reviewController.reviewData!.result
                                          .reviewsReceived!.length
                                      : 10)),
                      SizedBox(
                        height: 20.h,
                      ),
                      _reviewController.isSeeAll.value==true?const SizedBox():_reviewController
                              .reviewData!.result.reviewsReceived!.length >
                          10?
        
                        InkWell(
                          onTap: () {
                            _reviewController.isSeeAll.value = true;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: const Color(0xff187949)),
                            child: Text(
                              'See All Review',
                              style: myStyle(16.sp, FontWeight.w500,
                                  const Color(0xffF2F2F2)),
                            ),
                          ),
                        ):const SizedBox()
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
