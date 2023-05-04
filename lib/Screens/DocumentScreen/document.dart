import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/DocumentScreen/Controller/real_time_controller.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../Route/routes.dart';
import '../ProfileScreen/Controller/profile_controller.dart';

class Document extends StatelessWidget {
   Document({super.key});

  

  final TextEditingController nameController = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final _realTimeController = Get.put(RealTimeServiceController());

  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    if (_profileController.isUser.value == true) {
      _profileController.modeChange();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23.h,
              ),
              IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: Colors.green)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 120.w,
                        child: Container(
                          padding: EdgeInsets.all(8.0.w),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintText: "Search ",
                              hintStyle: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xffB7B7B7)),
                            ),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 20.w,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 120.w,
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          child: TextFormField(
                            controller: locationController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              hintText: "Location",
                              prefix: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                  size: 20.sp,
                                ),
                              ),
                              hintStyle: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: const Color(0xffB7B7B7)),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: const Color(0xff187949),
                          height: 50.h,
                          width: 45.w,
                          child: const Icon(
                            Icons.search,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                "Real Time Services",
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff555957),
                    letterSpacing: 1),
              ),
              SizedBox(
                height: 24.h,
              ),
              Obx(
                () => _realTimeController.isLoading.value
                    ?const CustomLoader()
                    : GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            _realTimeController.realTimeServiceModel.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 231.h,
                            crossAxisSpacing: 15.w,
                            mainAxisSpacing: 23.h,
                            crossAxisCount: 2),
                        itemBuilder: (_, index) {
                          var result =
                              _realTimeController.realTimeServiceModel[index];

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
                                      offset: const Offset(0, 1))
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
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),

                                          child: 
                                              Image.network(
                                                  result.serviceName.image!,fit: BoxFit.fill,)),

                                    ),
                                    Positioned(
                                        right: 10.w,
                                        top: 10.h,
                                        child: const Icon(
                                          Icons.favorite_border,
                                          color: Color(0xFF187949),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(result.user!.corporationName,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF272727),
                                      fontWeight: FontWeight.w400,
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  result.serviceName.name,
                                  style: GoogleFonts.roboto(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color:const Color(0xFF848484)),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.postAJob,arguments:{
                                        "isBookId":result.user!.id,
                                        "category":result.serviceName
                                       }); 
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 84.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF187949),
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: Center(
                                      child: Text(
                                        'Book Now',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  itemCard() {
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
                  child: Image.asset(
                    "images/img.jpg",
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
          Text("",
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
                'Book Now',
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
