import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/ReviewScreen/controller/review_controller.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../SettingsScreen/setting_page.dart';

class ReviewsPage extends StatelessWidget {
  ReviewsPage({Key? key}) : super(key: key);

  final _reviewController = Get.put(ReviewController());

  @override
  Widget build(BuildContext context) {
    // _reviewController.fetchReviw();
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
      body: Container(
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
                  "${_reviewController.reviewData.avgRating}",
                  style: myStyle(
                      20.sp, FontWeight.w700, Color.fromARGB(255, 154, 89, 89)),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: const Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: const Color(0xffEACA23),
                    size: 20.sp,
                  ),
                ],
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
                  Spacer(),
                  Text(
                    "${_reviewController.reviewData.avgRating}",
                    style: myStyle(20.sp, FontWeight.w500, textClr),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '(500)',
                    style: myStyle(
                        14.sp, FontWeight.w300, const Color(0xff848484)),
                  ),
                  Spacer(),
                  Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Color(0xff187949)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Filter',
                          style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
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
                            .reviewData.result.reviewsReceived![index];
                        return Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              color: const Color(0xffF8F8F8),
                              borderRadius: BorderRadius.circular(3.r)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 22.r,
                                  backgroundImage: NetworkImage(result
                                      .reviewedBy.userProfilePic!.picture)),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          result.reviewedBy.fullName,
                                          style: myStyle(
                                              18.sp, FontWeight.w500, textClr),
                                        ),
                                        Spacer(),
                                        Text(
                                          "",
                                          style: myStyle(14.sp, FontWeight.w400,
                                              Colors.black),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xffEACA23),
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xffEACA23),
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xffEACA23),
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xffEACA23),
                                          size: 20.sp,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xffEACA23),
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Text("")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          "",
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis,
                                          style: myStyle(14.sp, FontWeight.w400,
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
                      itemCount: _reviewController
                          .reviewData!.result.reviewsReceived!.length)),
              SizedBox(
                height: 20.h,
              ),
              Container(
                alignment: Alignment.center,
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: const Color(0xff187949)),
                child: Text(
                  'See All Review',
                  style:
                      myStyle(16.sp, FontWeight.w500, const Color(0xffF2F2F2)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
