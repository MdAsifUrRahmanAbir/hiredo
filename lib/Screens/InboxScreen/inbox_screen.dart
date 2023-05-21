import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/ProfileScreen/profile.dart';

import '../../utils/colors.dart';
import '../../widgets/data_controller.dart';
import '../SettingsScreen/setting_page.dart';

class InboxScreen extends StatelessWidget {
   InboxScreen({super.key});
  final _dataController=Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Massages',
          style: myStyle(20.sp, FontWeight.w600, const Color(0xFF272727)),
        ),
        actions:  [
          
        _dataController.profileImage.value!=""?  CircleAvatar(
          radius:20.r,
          backgroundColor: Colors.grey.shade300,
            backgroundImage: NetworkImage(_dataController.profileImage.value),
          ): Container(
            height:40.h,
            width: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300
            ),
            padding: EdgeInsets.all(10.h),
            child: Center(child: Image.asset("images/user_profile.png",fit: BoxFit.fill,)),
        
          ),
          SizedBox(width:15.w,)
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 26.w, right: 26.w, top:15.h),
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50.h,
                  padding: EdgeInsets.symmetric(horizontal:10.w),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(4.r),bottomLeft: Radius.circular(4.r)),
                    border: Border.all(
                       color:const Color(0xFF9CCDB5),
                          width: 1.0,
                    )
                  ),
                  child: TextFormField(
                    onChanged: (v) {
                                 
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      hintStyle:TextStyle(color:const Color(0xFFB7B7B7),fontSize:16.sp),
                      border:InputBorder.none
                      
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  height: 50.h,
                  decoration: BoxDecoration(
                     color: const Color(0xff187949),
                    borderRadius:  BorderRadius.only(topRight:Radius.circular(4.r),bottomRight: Radius.circular(4.r)),
                  ),
                 
                  child: Row(
                    children: [
                      Text(
                        'Filter',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFFFFFFF)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                       Icon(
                        Icons.filter_list_sharp,
                        color: Colors.white,
                        size: 25.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              
              itemCount: 30,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.chatScreen);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 12.h),
                        margin: EdgeInsets.only(bottom:20.h),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                          CircleAvatar(
                            radius: 30.w,
                            backgroundImage:
                                const AssetImage('images/img2.png'),
                          ),
                          Positioned(
                              
                             
                              bottom:5.w,
                              right: 2.w,
                              child: Container(
                                height: 12.w,
                                width: 12.w,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF008A00),
                                    shape: BoxShape.circle),
                              ))
                        ]),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jasim Uddnin',
                                style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Yes, i’m Good.',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)
                                        .withOpacity(0.5)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        )),
                        Column(
                          children: [
                            Text(
                              '10:17',
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF424242)),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6.h, vertical: 6.h),
                              decoration: const BoxDecoration(
                                  color:
                                      Color(0xFFE8FAF1),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF187949)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
