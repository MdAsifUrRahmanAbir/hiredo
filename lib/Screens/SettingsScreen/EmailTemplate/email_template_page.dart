import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SettingsScreen/EmailTemplate/Controller/email_templete_controller.dart';

import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

class EmailTemplatePage extends StatelessWidget {
  EmailTemplatePage({Key? key}) : super(key: key);

  final _emailTemplateController = Get.put(EmailTemplateController());

  @override
  Widget build(BuildContext context) {
    _emailTemplateController.getEmailList(false);
  
    return Scaffold(
      backgroundColor: scaffoldClr,
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
          'Email Templates',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Obx(()=>_emailTemplateController.isLoading.value?CustomLoader()
        : Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My templates',
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF272727)),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r))),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Email Templates',
                                    style: GoogleFonts.roboto(
                                        fontSize: 20.sp,
                                        color: const Color(0xFF272727),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: _emailTemplateController
                                        .templeteNameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Template Name',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextFormField(
                                    controller: _emailTemplateController
                                        .messageController,
                                    decoration: const InputDecoration(
                                      hintText: 'Message',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _emailTemplateController
                                          .addToEmailTemplate();
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF187949),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Submit',
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Obx(
                                            () => SizedBox(
                                              width: _emailTemplateController
                                                      .isAddLoading.value
                                                  ? 5.0.w
                                                  : 0,
                                            ),
                                          ),
                                          Obx(() {
                                            if (_emailTemplateController
                                                .isAddLoading.value) {
                                              return SizedBox(
                                                height: 10.h,
                                                width: 10.w,
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else {
                                              return const SizedBox();
                                            }
                                          })
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                   
                   
                    },
                    child: Container(
                      height: 28.h,
                      width: 104.w,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 12.sp,
                            color: scaffoldClr,
                          ),
                          Text(
                            'Add template',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var result =
                              _emailTemplateController.emailTemplateModel[index];
                          return Container(
                            height: 52.h,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10.w),
                            margin: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    result.templateName,
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF272727)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                       showModalBottomSheet(
                          context: context,
                          isDismissible: true,
                          backgroundColor: const Color(0xFFFFFFFF),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r))),
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Text(
                                    'Email Templates',
                                    style: GoogleFonts.roboto(
                                        fontSize: 20.sp,
                                        color: const Color(0xFF272727),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  TextFormField(
                                    controller: _emailTemplateController
                                        .templeteNameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Template Name',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextFormField(
                                    controller: _emailTemplateController
                                        .messageController,
                                    decoration: const InputDecoration(
                                      hintText: 'Message',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0.5)),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF000000),
                                              width: 0)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                       _emailTemplateController.updateData("${result.id}");
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF187949),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Update',
                                            style: GoogleFonts.roboto(
                                                color: const Color(0xFFFFFFFF),
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Obx(
                                            () => SizedBox(
                                              width: _emailTemplateController
                                                      .isAddLoading.value
                                                  ? 5.0.w
                                                  : 0,
                                            ),
                                          ),
                                          Obx(() {
                                            if (_emailTemplateController
                                                .isAddLoading.value) {
                                              return SizedBox(
                                                height: 10.h,
                                                width: 10.w,
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else {
                                              return const SizedBox();
                                            }
                                          })
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                   
                   
                                   
                                  },
                                  child: Container(
                                    height: 24.h,
                                    width: 48.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF187949),
                                        borderRadius: BorderRadius.circular(3.r)),
                                    child: Center(
                                      child: Text(
                                        'Edit',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFFFFFFFF)),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                     
                                     _emailTemplateController.deleteEmail("${result.id}");
                                    },
                                    icon: const Icon(
                                      Icons.delete_sweep,
                                      color: Color(0xFF848484),
                                    ))
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount:
                            _emailTemplateController.emailTemplateModel.length),
              
              Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Color(0xFF848484),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Learn more about SMS templates',
                    style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF848484)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
