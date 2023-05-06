import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/utils/colors.dart';
import '../../nav_bar_page/main_controller.dart';
import '../../widgets/custom_loader.dart';

import 'package:percent_indicator/percent_indicator.dart';
import '../../widgets/data_controller.dart';
import '../Service/service.dart';
import 'Controller/profile_controller.dart';

final _mainController = Get.put(MainScreenController());
final profileController = Get.put(ProfileController());

class Profile extends StatelessWidget {
  Profile({super.key});

  final _dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    _dataController.getData();
    // profileController.getServices();
    // profileController.getLeadCount();
    // profileController.fetchProfileData();
    // profileController.getMyResponseCount();
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              _mainController.initIndex.value = 0;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Profile',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Obx(
        () => profileController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              height: 63.h,
                              width: 63.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade500),
                                color: Colors.grey.shade400,
                              ),
                              child: CircleAvatar(
                                backgroundImage: profileController
                                        .imagePath.isNotEmpty
                                    ? FileImage(File(
                                        profileController.imagePath.toString()))
                                    : null,
                              ),
                            ),
                            Positioned(
                                bottom: -20.h,
                                right: -20.h,
                                child: IconButton(
                                    onPressed: () {
                                      profileController.getImage(false);
                                    },
                                    icon: Icon(
                                      Icons.camera_alt,
                                      size: 25.sp,
                                    )))
                          ],
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileController.profileData!.user.fullName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: myStyle(16.sp, FontWeight.w500, textClr),
                              ),
                              Text(
                                profileController.profileData!.user.email,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: myStyle(14.sp, FontWeight.w400,
                                    const Color(0xff424242)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                            onTap: () {
                              profileController.modeChange();
                            },
                            child: Image.asset(
                              "images/switchimg.png",
                              height: 26.h,
                              width: 26.w,
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Icon(Icons.more_vert)
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    profileController.isUser.value
                        ? _isUser()
                        : _isProfational(context),
                    SizedBox(
                      height: 37.h,
                    ),
                    InkWell(
                      onTap: () {
                        profileController.hendleLogout(context);
                      },
                      child: Container(
                          height: 43.h,
                          width: 124.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: const Color(0xffDF2929)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.logout_outlined,
                                color: scaffoldClr,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Logout',
                                style:
                                    myStyle(16, FontWeight.w500, scaffoldClr),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 80.h,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  _isProfational(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            child: ListTile(
          title: Text(
            "Phone number",
            style: GoogleFonts.roboto(fontSize: 20.sp, color: Colors.black),
          ),
          subtitle: Text(
            profileController.profileData!.user.phoneNumber,
            style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.black),
          ),
        )),
        Card(
            child: ListTile(
          title: Text(
            "Corporation name",
            style: GoogleFonts.roboto(fontSize: 20.sp, color: Colors.black),
          ),
          subtitle: Text(
            profileController.profileData!.user.corporationName,
            style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.black),
          ),
        )),
        Card(
            child: ListTile(
          title: Text(
            "Corporation number",
            style: GoogleFonts.roboto(fontSize: 20.sp, color: Colors.black),
          ),
          subtitle: Text(
            profileController.profileData!.user.corporationNumber,
            style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.black),
          ),
        )),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.postAJob,
                  arguments: {"isBookId": null, "category": null});
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: themeColorGreen, fixedSize: Size(150.w, 50.h)),
            child: Text(
              "Create Post",
              style: GoogleFonts.roboto(
                  fontSize: 16.sp, fontWeight: FontWeight.w600),
            ))
      ],
    );
  }

  _isUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r), color: containerClr),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Your profile is ${profileController.profileData!.percentageComplete}% complete",
                      style: myStyle(16, FontWeight.w500, textClr)),
                  Image.asset(
                    "images/editicon.png",
                    height: 22.h,
                    width: 22.w,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 8.h,
                      percent:
                          profileController.profileData!.percentageComplete /
                              100,
                      barRadius: Radius.circular(30.r),
                      progressColor: backIconClr,
                      backgroundColor: scaffoldClr,
                    ),
                  ),
                  Text(
                    "${profileController.profileData!.percentageComplete / 10}/10",
                    style: myStyle(14, FontWeight.w500, textClr),
                  )
                ],
              ),
              Text(
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                style: myStyle(14, FontWeight.w400, const Color(0xff424242)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          height: 167.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r), color: containerClr),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OverView',
                style: myStyle(20.sp, FontWeight.w500, textClr),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileController.profileData!.badges != []
                      ? Row(
                          children: [
                            Image.asset('images/eliteicon.png'),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Elite Pro",
                              style: myStyle(14.sp, FontWeight.w500, textClr),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Image.network(
                              baseUrl +
                                  profileController
                                      .profileData!.badges[0].image,
                              height: 15.sp,
                              width: 15.sp,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              profileController.profileData!.badges[0].title,
                              style: myStyle(14.sp, FontWeight.w500, textClr),
                            )
                          ],
                        ),
                  Row(
                    children: [
                      Image.asset('images/tick.png'),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '14 Hires on Ringknock',
                        style: myStyle(14.sp, FontWeight.w500, textClr),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('images/moon.png'),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '7 Years in business',
                        style: myStyle(14.sp, FontWeight.w500, textClr),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('images/tick.png'),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        '6 Hour response  time',
                        style: myStyle(14.sp, FontWeight.w500, textClr),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_rounded,
                    size: 18.sp,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '11-50 Staff',
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF272727)),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          color: containerClr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Tags',
                style: myStyle(20, FontWeight.w500, textClr),
              ),
              SizedBox(
                height: 5.h,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: profileController.serviceList.length < 6
                      ? profileController.serviceList.length
                      : 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 25.sp,
                      crossAxisSpacing: 15.w,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Text(
                        profileController.serviceList[index].serviceName.name
                            .toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        _cardItem(
            onTap: () {
              Get.toNamed(Routes.leadPage);
            },
            icon: Icons.star_border_outlined,
            text: 'Leads',
            isCount: true,
            isLoading: profileController.isLeadLoading.value,
            count: profileController.leadsCount.value.toString()),
        _cardItem(
            onTap: () {
              Get.toNamed(Routes.myResponse);
            },
            icon: Icons.sports_handball_rounded,
            text: 'My Responces',
            isCount: true,
            isLoading: profileController.isMyresponseLoading.value,
            count: profileController.myResponseCount.value.toString()),
        _cardItem(
          onTap: () {
            Get.toNamed(Routes.wishListScreen);
          },
          icon: Icons.favorite_border,
          text: 'Wishlist',
        ),
        _cardItem(
          onTap: () {
            Get.toNamed(Routes.settingPage);
          },
          icon: Icons.settings,
          text: 'Settings',
        ),
        _cardItem(
          onTap: () {
            Get.toNamed(Routes.helpPage);
          },
          icon: Icons.help_outline,
          text: 'Help',
        ),
        _cardItem(
            onTap: () {
              //  Get.toNamed(Routes.servicePage);
              Get.to(ServiceScreen());
            },
            icon: Icons.rotate_right,
            text: 'Services',
            isCount: true,
            count: profileController.serviceList.length.toString()),
        _cardItem(
            onTap: () {
              Get.toNamed(Routes.locationPage);
            },
            icon: Icons.location_pin,
            text: 'Locations',
            isCount: true,
            count: 50.toString()),
      ],
    );
  }

  _cardItem(
      {required String text,
      String? count,
      bool? isLoading,
      required Function() onTap,
      required IconData icon,
      bool? isCount = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 15.h),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: text == "Leads"
                      ? themeColorGreen
                      : const Color(0xFF272727),
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  text,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Row(
              children: [
                isCount!
                    ? isLoading == true
                        ? SizedBox(
                            height: 18.h,
                            width: 18.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
                          )
                        : Container(
                            height: 18.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: themeColorGreen.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                              count!,
                              style: TextStyle(
                                  fontSize: 12.sp, color: themeColorGreen),
                            )),
                          )
                    : const SizedBox(),
                const Icon(
                  Icons.navigate_next,
                  color: themeColorGreen,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
