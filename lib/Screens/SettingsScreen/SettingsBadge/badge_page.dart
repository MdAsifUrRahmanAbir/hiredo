import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/Screens/SettingsScreen/SettingsBadge/Controller/bedge_controller.dart';

import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../../Services/api_component.dart';
import 'badges_second_page.dart';

class BadgePage extends StatelessWidget {

  BadgePage({Key? key}) : super(key: key);

  final _bedgeController = Get.put(BedgeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'Settings',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Obx(()=> _bedgeController.isLoading.value? CustomLoader():
       SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'Badge',
                  style: myStyle(20.sp, FontWeight.w500, textClr),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.all(10.w),
                color: containerClr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: themeColorGreenbright,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: RichText(
                            text: TextSpan(
                                text:
                                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet',
                                style: myStyle(14.sp, FontWeight.w400, textClr),
                                children: [
                              TextSpan(
                                  text: ' Learn More',
                                  style: myStyle(
                                      14.sp, FontWeight.w400, themeColorGreen))
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
      
      
              ListView.separated
              (
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bedgeController.bedgeList.length,
                itemBuilder: (context, index){
                  var result = _bedgeController.bedgeList[index];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.h),
                    decoration: BoxDecoration(
                      color: scaffoldClr,
                      boxShadow: [
                        BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), 
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // add image

                        Image.network(baseUrl+result.image),

                        Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    result.title,
                    style: myStyle(14.sp, FontWeight.bold, textClr),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    result.description,
                    style: myStyle(14.sp, FontWeight.w400, textClr),
                  )
                ],
                        ),
                        GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.badgeDetails,arguments:{
                    "image":baseUrl+result.image,
                    "title":result.title,
                    "des":result.longDescription
                  });

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 34.h,
                  width: 72.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      color: backIconClr),
                  child: Text(
                    'Select',
                    style: myStyle(14.sp, FontWeight.w400, scaffoldClr),
                  ),
                ),
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) { 
                 return SizedBox(height: 15.h,);
                 },
        
              ),
      
             
              //   text: 'The Professional Badge',
              //   onTap: () {},
              // ),
            
            
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.question_mark,
                      size: 18.sp,
                      color: themeColorGreenbright,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Why use Ringknock Badges',
                      style: myStyle(20.sp, FontWeight.w500, textClr),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Container(
                height: 215,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.all(10.w),
                color: containerClr,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Upgrading your app with a ringknock badge helps boost search engine rankings (SEO) and attractsmore customers',
                          style: myStyle(14.sp, FontWeight.w400, Color(0xff424242)),
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Visitors to your website will be able to see your reviews and leave their own. This increases customer trust, gaining you more business - for free',
                          style: myStyle(14.sp, FontWeight.w400,  Color(0xff424242)),
                          overflow: TextOverflow.clip,
                        ))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Icon(
                            Icons.circle,
                            size: 6.sp,
                            color: textClr,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                            child: Text(
                          'Customers are much more likely to hire professionals with 1 or more badges on display',
                          style: myStyle(14.sp, FontWeight.w400,  Color(0xff424242)),
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

