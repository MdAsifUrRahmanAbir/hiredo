import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/TrackingScreen/TabsScreen/bookingComplete.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/data_controller.dart';
import 'Controller/tracking_controller.dart';
import 'TabsScreen/bookingPending.dart';
import 'TabsScreen/trackingpost.dart';
import 'TabsScreen/trackingpostorder.dart';

class TrackingScreen extends StatelessWidget {
  TrackingScreen({super.key});

  final _trackingController = Get.put(TrackingController());
 

  @override
  Widget build(BuildContext context) {
    _trackingController.getUserMode();
    _trackingController.currentIndex.value=0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.arrow_back,
        //       size: 25.sp,
        //       color: const Color(0xff187949),
        //     )),
        title: Text(
          "Tracking Post/Order",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff272727)),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       height: 40.h,
        //       width: 40.w,
        //       decoration: const BoxDecoration(
        //           image: DecorationImage(
        //               image: AssetImage("images/img2.png"), fit: BoxFit.cover),
        //           shape: BoxShape.circle),
        //     ),
        //   )
        // ],
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () => _trackingController.isLoading.value
            ? const Center(
                child: CustomLoader(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () {
                              _trackingController.currentIndex.value = 0;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 40.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  color:
                                      _trackingController.currentIndex.value ==
                                              0
                                          ? const Color(0xFF187949)
                                          : null,
                                  border: Border.all(
                                      color: _trackingController
                                                  .currentIndex.value ==
                                              0
                                          ? const Color(0xFF187949)
                                          : const Color(0xFF187949)),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Center(
                                child: Text(
                                  "Pending Post",
                                  style: GoogleFonts.roboto(
                                      color: _trackingController
                                                  .currentIndex.value ==
                                              0
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFF424242),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              _trackingController.currentIndex.value = 1;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 40.h,
                              width: 180.w,
                              decoration: BoxDecoration(
                                  color:
                                      _trackingController.currentIndex.value ==
                                              1
                                          ? const Color(0xFF187949)
                                          : null,
                                  border: Border.all(
                                      color: _trackingController
                                                  .currentIndex.value ==
                                              1
                                          ? const Color(0xFF187949)
                                          : const Color(0xFF187949)),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Center(
                                child: Text(
                                  "Complete Post",
                                  style: GoogleFonts.roboto(
                                      color: _trackingController
                                                  .currentIndex.value ==
                                              1
                                          ? const Color(0xFFFFFFFF)
                                          : const Color(0xFF424242),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Obx(() => _trackingController.userRole.value
                        ? Expanded(
                            child: _trackingController.currentIndex.value == 0
                                ? TrackingPostOrder()
                                : TrackingPostOrderTwo())
                        : Expanded(
                            child: _trackingController.currentIndex.value == 0
                                ? BookingPandeingScreen()
                                : BookingCompleteScreen())),
                  ],
                ),
              ),
      ),
    );
  }
}
