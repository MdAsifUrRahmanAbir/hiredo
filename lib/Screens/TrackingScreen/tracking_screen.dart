import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/QuestionScreen/question_screen.dart';

import 'Controller/tracking_controller.dart';

class TrackingScreen extends StatelessWidget {
  TrackingScreen({super.key});

  final _trackingController = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 25.sp,
              color: const Color(0xff187949),
            )),
        title: Text(
          "Tracking Post/Order",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff272727)),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/img2.png"), fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: _trackingController.items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _trackingController.currentIndex.value = index;
                        },
                        child: Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.all(5.w),
                            height: 40.h,
                            width: 169.w,
                            decoration: BoxDecoration(
                                color: _trackingController.currentIndex.value ==
                                        index
                                    ? const Color(0xFF187949)
                                    : null,
                                border: Border.all(
                                    color: _trackingController
                                                .currentIndex.value ==
                                            index
                                        ? const Color(0xFF187949)
                                        : const Color(0xFF187949)),
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Center(
                              child: Text(
                                _trackingController.items[index],
                                style: GoogleFonts.roboto(
                                    color: _trackingController
                                                .currentIndex.value ==
                                            index
                                        ? const Color(0xFFFFFFFF)
                                        : const Color(0xFF424242),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Obx(
                () => Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  height: 470.h,
                  child: _trackingController
                      .screen[_trackingController.currentIndex.value],
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(QuestionScreen());
                },
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFF187949),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Center(
                    child: Text(
                      'Add a new job post',
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFF2F2F2)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
