import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:jiffy/jiffy.dart';

import '../../Route/routes.dart';

import '../../widgets/custom_loader.dart';
import 'Controller/myresponse_controller.dart';

class MyResponse extends StatefulWidget {
  const MyResponse({Key? key}) : super(key: key);

  @override
  State<MyResponse> createState() => _MyResponseState();
}

class _MyResponseState extends State<MyResponse> {
  final _myResponseController = Get.put(MyResponseController());

  @override
  Widget build(BuildContext context) {
    _myResponseController.firstLoad();
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
              color: Color(0xff187949),
            )),
        title: Text(
          'My Responce',
          style: myStyle(20.sp, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
        ],
      ),
      body: Obx(
        () => _myResponseController.isFirstLoadRunning.value
            ? const CustomLoader()
            : ListView(
                controller: _myResponseController.scrolController,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 10.h),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: _myResponseController.searchController,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                _myResponseController.isSearch.value = false;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.withOpacity(0.3),
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.withOpacity(0.3),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_myResponseController
                              .searchController.text.isNotEmpty) {
                            _myResponseController.isSearch.value = true;
                            _myResponseController.getSearchMyResponse();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 50.h,
                          color: const Color(0xff187949),
                          child: Row(
                            children: [
                              Text(
                                'Filter',
                                style: myStyle(
                                    16.sp, FontWeight.normal, Colors.white),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Icon(
                                Icons.filter_list_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: const Color(0xffFAFAFA)),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_myResponseController.data.toString()} Pending Responces",
                              style:
                                  myStyle(18.sp, FontWeight.w500, Colors.black),
                            ),
                            Text(
                              'Updated just now',
                              style:
                                  myStyle(14.sp, FontWeight.w400, Colors.black),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.refresh,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          'Refresh',
                          style: myStyle(14.sp, FontWeight.w500, Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _myResponseController.isSearch.value
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var data = _myResponseController
                                .searchMyResponseList[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.myresponseDetailsScreen,
                                    arguments: data);
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      data.posts.user.userProfilePic == null
                                          ? CircleAvatar(
                                              radius: 20.r,
                                              backgroundColor:
                                                  Colors.grey.shade500,
                                            )
                                          : CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage: NetworkImage(data
                                                  .posts
                                                  .user
                                                  .userProfilePic!
                                                  .picture),
                                            ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.posts.user.fullName,
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.bold,
                                                      Colors.black),
                                                ),
                                                Icon(
                                                  Icons.restaurant,
                                                  color: Colors.green,
                                                  size: 15.sp,
                                                ),
                                                Text(
                                                  data.posts.category.name,
                                                  style: myStyle(
                                                      12.sp,
                                                      FontWeight.w400,
                                                      Colors.black),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w,
                                                      vertical: 5.w),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF2F2F2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r)),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.pink,
                                                        size: 18.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Text(
                                                        data.status,
                                                        style: myStyle(
                                                            12.sp,
                                                            FontWeight.w400,
                                                            Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.green,
                                                  size: 16.sp,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    data.posts.location,
                                                    style: myStyle(
                                                        12.sp,
                                                        FontWeight.w400,
                                                        Colors.grey),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: '',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF187949)),
                                        children: data.posts.postObject
                                            .map((e) => TextSpan(
                                                text: e.question.qs,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF848484))))
                                            .toList(),
                                      )),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: const Color(0xffF3F3F6)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.beenhere_outlined,
                                          size: 16.sp,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'You send ${data.user.fullName} an email',
                                          style: myStyle(14.sp, FontWeight.w400,
                                              Colors.black),
                                        ),
                                        const Spacer(),
                                        Text(
                                            Jiffy.parse(data.createdAt)
                                                .fromNow(),
                                            style: myStyle(14.sp,
                                                FontWeight.w400, Colors.black))
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount:
                              _myResponseController.searchMyResponseList.length,
                        )
                      : ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var data =
                                _myResponseController.myResponseList[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.myresponseDetailsScreen,
                                    arguments: data);
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      data.posts.user.userProfilePic == null
                                          ? CircleAvatar(
                                              radius: 20.r,
                                              backgroundColor:
                                                  Colors.grey.shade500,
                                            )
                                          : CircleAvatar(
                                              radius: 20.r,
                                              backgroundImage: NetworkImage(data
                                                  .posts.user.userProfilePic),
                                            ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.posts.user.fullName,
                                                  style: myStyle(
                                                      14.sp,
                                                      FontWeight.bold,
                                                      Colors.black),
                                                ),
                                                Icon(
                                                  Icons.restaurant,
                                                  color: Colors.green,
                                                  size: 15.sp,
                                                ),
                                                Text(
                                                  data.posts.category.name,
                                                  style: myStyle(
                                                      12.sp,
                                                      FontWeight.w400,
                                                      Colors.black),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8.w,
                                                      vertical: 5.w),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF2F2F2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r)),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.pink,
                                                        size: 18.sp,
                                                      ),
                                                      SizedBox(
                                                        width: 6.w,
                                                      ),
                                                      Text(
                                                        data.status,
                                                        style: myStyle(
                                                            12.sp,
                                                            FontWeight.w400,
                                                            Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.green,
                                                  size: 16.sp,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  data.posts.location,
                                                  style: myStyle(
                                                      12.sp,
                                                      FontWeight.w400,
                                                      Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: '',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF187949)),
                                        children: data.posts.postObject
                                            .map((e) => TextSpan(
                                                text: e.question.qs,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF848484))))
                                            .toList(),
                                      )),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: const Color(0xffF3F3F6)),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.beenhere_outlined,
                                          size: 16.sp,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'You send ${data.user.fullName} an email',
                                          style: myStyle(14.sp, FontWeight.w400,
                                              Colors.black),
                                        ),
                                        const Spacer(),
                                        Text(
                                            Jiffy.parse(data.createdAt)
                                                .fromNow(),
                                            style: myStyle(14.sp,
                                                FontWeight.w400, Colors.black))
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                          itemCount:
                              _myResponseController.myResponseList.length,
                        ),
                  if (_myResponseController.isLoadMoreRunning.value == true)
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
