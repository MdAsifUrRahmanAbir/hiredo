

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';
import 'package:jiffy/jiffy.dart';

import '../../GoogleMapService/google_map_show.dart';
import '../LeadsScreen/Controller/lead_controller.dart';
import '../LeadsScreen/Model/leads_model.dart';
import '../ResistrationScreen/component/custome_text_field.dart';
import 'Controller/lead_details_controller.dart';

class LeadsDetailsScreen extends StatelessWidget {
  LeadsDetailsScreen({
    super.key,
  });

 final Result leadData = Get.arguments;

  final _leadDetailsController = Get.put(LeadDetailsController());
  final _leadController = Get.put(LeadController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _leadDetailsController.getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: themeColorGreen,
        ),
        backgroundColor: Colors.white,
        title: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          horizontalTitleGap: 0,
          leading: leadData.user.userProfilePic == null
              ? CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade400,
                )
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                      "${leadData.user.userProfilePic}"),
                ),
          title: Text(
            leadData.user.fullName,
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
        ),
        actions: [Image.asset('images/notification.png')],
      ),
    
    
      body: Obx(
        () => _leadDetailsController.isLoading.value
            ? const CustomLoader()
            : SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.w, vertical: 17.h),
                        child: Obx(
                          () => Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFAFAFA),
                                    borderRadius: BorderRadius.circular(3.r)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            leadData.category.name,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF272727)),
                                          ),
                                        ),
                                        Container(
                                          height: 27.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 6.h),
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFE8FAF1),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.access_time_filled,
                                                size: 15.h,
                                                color: const Color(0xFF187949),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              Text(
                                                Jiffy.parse(leadData.created)
                                                    .fromNow(),
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xFF187949)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // ListTile(
                                    SizedBox(height: 5.h,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "images/location.png",
                                          height: 15.h,
                                          width: 11.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                         leadData.location,
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                color: const Color(0xFF424242)),
                                                
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                             
                             
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: const Color(0xFF187949),
                                    size: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Obx(()=>
                                     Text(
                                     _leadController.isContect.contains(leadData.id)?leadData.user.phoneNumber: '+122******6***',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF272727)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    height: 12.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFE8FAF1),
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'images/righttick.png',
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'verified',
                                          style: GoogleFonts.roboto(
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF187949)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                             
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: const Color(0xFF187949),
                                    size: 20.sp,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Obx(()=>
                                     Text(
                                      _leadController.isContect.contains(leadData.id)?leadData.user.email:'your******@email.com',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF272727)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            
                            
                              Container(
                                height: 40.h,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFAFAFA)),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(0xFF187949),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(0xFF187949),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(0xFF187949),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(0xFFF2F2F2),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    CircleAvatar(
                                      radius: 8.r,
                                      backgroundColor: const Color(0xFFF2F2F2),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    const Spacer(),
                                    Text(
                                      leadData.responseCount == 0
                                          ? "${leadData.responseCount} Professionals did not respond"
                                          : '${leadData.responseCount - 1}/${leadData.responseCount - 1} professionals have responded',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF000000)),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      height: 18.h,
                                      width: 14.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: const Color(0xFF292D32))),
                                      child: const Center(
                                        child: Text('!'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if(!_leadController.isNotInterested.contains(leadData.id)&&!_leadController.isContect.contains(leadData.id)){
                                           _leadDetailsController
                                            .handleContact(leadData.id);
                                        }
                                     
                                    },
                                    child: Container(
                                      height: 50.h,
                                      width: 100.w,
                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF187949),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Center(
                                        child: Text(
                                          'Contact',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFFFFFFFF)),
                                        ),
                                      ),
                                    ),
                                 
                                 
                                  ),

                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  if(_leadDetailsController.onClickResponseList[0].oneClickResponse&&_leadDetailsController.onClickResponseList[0].template!=null)
                                    InkWell(
                                      onTap: (){
                                                                Uri uri = Uri(
                                                scheme: 'mailto',
                                                path: leadData.user.email,
                                                query: _leadDetailsController
                                                    .encodeQueryParameters(<String, String>{
                                                  'subject':_leadDetailsController.onClickResponseList[0].template.templateName,
                                                  'body': _leadDetailsController
                                                      .onClickResponseList[0].template.message
                                                      
                                                }));
                                            _leadDetailsController.sendLaunchUrl(uri: uri);
                                      },
                                      child: Container(
                                      height: 50.h,
                                      width: 110.w,
                                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFF187949)),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Center(
                                        child: Text(
                                          'One Click Responce',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              
                                              color: const Color(0xFF187949)),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                                                      ),
                                    ),
                                  
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Obx(()=>
                                     InkWell(
                                      onTap: (){
                                        if(!_leadController.isNotInterested.contains(leadData.id)&&!_leadController.isContect.contains(leadData.id)){
                                            _leadDetailsController.hendleNotInterested(leadData.id);
                                        }
                                        
                                      },
                                      child: Container(
                                        height: 50.h,
                                        width: 100.w,
                                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color:!_leadController.isNotInterested.contains(leadData.id)&&!_leadController.isContect.contains(leadData.id)? const Color(0xFF187949):Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: Center(
                                          child:_leadDetailsController.isNotInterestedLoading.value?SizedBox(
                                            height:10.h,
                                            width: 10.h,
                                            child: const CircularProgressIndicator(
                                              strokeWidth:1,
                                              color: themeColorGreen,
                                            ),
                                          ):Text(
                                            'Not interested',
                                            style: GoogleFonts.roboto(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color:!_leadController.isNotInterested.contains(leadData.id)&&!_leadController.isContect.contains(leadData.id)? const Color(0xFF187949):Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "images/b.png",
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "${leadData.postCredit} Credits",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF848484)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              if (_leadController.isContect
                                  .contains(leadData.id))
                                _contactVisiable(context),

                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Details',
                                style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Divider(
                                color:
                                    const Color(0xFF848484).withOpacity(0.05),
                                height: 1,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final qansData = leadData.postObject[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        qansData.question.qs,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF424242)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        qansData.pAnswer.options,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF424242)),
                                      ),
                                    ],
                                  );
                                },
                                itemCount: leadData.postObject.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                  height: 20.h,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),

                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              //   child: Divider(
                              //     color: const Color(0xFF848484).withOpacity(0.05),
                              //     height: 5.h,
                              //     thickness: 3,
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 15.h,
                              // ),
                              // Text(
                              //   'Not seeing the right leads?',
                              //   style: GoogleFonts.roboto(
                              //       fontSize: 14.sp,
                              //       fontWeight: FontWeight.w400,
                              //       color: const Color(0xFF272727)),
                              // ),
                              // SizedBox(
                              //   height: 15.h,
                              // ),
                              // Text(
                              //   'Stop seeing leads with specific answers by customising your settings.',
                              //   style: GoogleFonts.roboto(
                              //       fontSize: 14.sp,
                              //       fontWeight: FontWeight.w400,
                              //       color: const Color(0xFF424242)),
                              // ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // Row(
                              //   children: [
                              //     Image.asset('images/settings2.png'),
                              //     SizedBox(
                              //       width: 5.w,
                              //     ),
                              //     Text(
                              //       'Update lead settings',
                              //       style: GoogleFonts.roboto(
                              //           fontSize: 14.sp,
                              //           fontWeight: FontWeight.w400,
                              //           color: const Color(0xFF187949)),
                              //     )
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                        child: GoogleMapsShow(lat:leadData.latitude!,leng:leadData.longitude!,),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  _contactVisiable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          title: Text(
            "Give them a call",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          subtitle: Text(
            "Connect with the customer now to discuss their project directly",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          leading: CircleAvatar(
              radius: 30.r,
              backgroundColor: const Color(0xFFF3F3F6),
              child: Icon(
                Icons.call,
                size: 25.sp,
              )),
          trailing: InkWell(
            onTap: () {
              showNumber(context);
            },
            child: Container(
              height: 40.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: themeColorGreen),
              child: Text(
                "Show Number",
                style: GoogleFonts.roboto(fontSize: 16.sp, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          title: Text(
            "Send an email",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          subtitle: Text(
            "Send a template or custom eamil to introduce yourself",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          leading: CircleAvatar(
              radius: 30.r,
              backgroundColor: const Color(0xFFF3F3F6),
              child: Icon(
                Icons.check,
                size: 25.sp,
              )),
          trailing: Column(
            children: [
              InkWell(
                onTap: () {
                  _sendEmailTemplete(context);
                },
                child: Container(
                  height: 40.h,
                  width: 120.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: themeColorGreen),
                  child: Text(
                    "Use email template",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                  onTap: () {
                    _sendCustomEmail(context);
                  },
                  child: Text(
                    "Send a custom email",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                    maxLines: 1,overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          title: Text(
            "Send an Sms",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          subtitle: Text(
            "Send a template or custom Sms to introduce yourself",
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          leading: CircleAvatar(
              radius: 30.r,
              backgroundColor: const Color(0xFFF3F3F6),
              child: Icon(
                Icons.message,
                size: 25.sp,
              )),
          trailing: Column(
            children: [
              InkWell(
                onTap: () {
                  _sendSmsTemplete(context);
                },
                child: Container(
                  height: 40.h,
                  width: 120.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: themeColorGreen),
                  child: Text(
                    "Use Sms template",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                  onTap: () {
                    _sendCustomSms(context);
                  },
                  child: Text(
                    "Send a custom Sms",
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline),
                    maxLines: 1,overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  showNumber(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: const Color(0xFFF3F3F6),
                          child: Icon(
                            Icons.close,
                            size: 15.r,
                          ),
                        ),
                      )
                    ],
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    minLeadingWidth: 0,
                    minVerticalPadding: 0,
                    title: Text(
                      leadData.user.fullName,
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      leadData.user.phoneNumber,
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        _leadDetailsController.sendLaunchUrl(
                            uri: Uri.parse("tel:${leadData.user.phoneNumber}"));
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: themeColorGreen),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 25.h,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  _sendEmailTemplete(BuildContext context) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: const Color(0xFFF3F3F6),
                        child: Icon(
                          Icons.close,
                          size: 15.r,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "Use a template",
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Select your template to send to Mark",
                  style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount:
                            _leadDetailsController.emailTemplateList.length,
                        itemBuilder: (context, index) {
                          var data =
                              _leadDetailsController.emailTemplateList[index];
                          return InkWell(
                            onTap: () {
                              _leadDetailsController.isSelectTemplete.value =
                                  index;
                            },
                            child: Obx(
                              () => Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _leadDetailsController
                                                  .isSelectTemplete.value ==
                                              index
                                          ? themeColorGreen
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Text(
                                  data.templateName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    Uri uri = Uri(
                        scheme: 'mailto',
                        path: leadData.user.email,
                        query: _leadDetailsController
                            .encodeQueryParameters(<String, String>{
                          'subject': _leadDetailsController
                              .emailTemplateList[
                                  _leadDetailsController.isSelectTemplete.value]
                              .templateName,
                          'body': _leadDetailsController
                              .emailTemplateList[
                                  _leadDetailsController.isSelectTemplete.value]
                              .message
                        }));
                    _leadDetailsController.sendLaunchUrl(uri: uri);
                    // _leadDetailsController.sendEmail(
                    //     postId: leadData.id,
                    //     sub: _leadDetailsController
                    //         .emailTemplateList[
                    //             _leadDetailsController.isSelectTemplete.value]
                    //         .templateName,
                    //     message: _leadDetailsController
                    //         .emailTemplateList[
                    //             _leadDetailsController.isSelectTemplete.value]
                    //         .message,
                    //     userId: leadData.user.id);
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFF187949),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send email',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Obx(
                          () => SizedBox(
                            width:
                                _leadDetailsController.isSendEmailLoading.value
                                    ? 15.w
                                    : 0,
                          ),
                        ),
                        Obx(() {
                          if (_leadDetailsController.isSendEmailLoading.value) {
                            return SizedBox(
                              height: 15.sp,
                              width: 15.sp,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
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
                ),
              ],
            ),
          ));

  _sendCustomEmail(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: const Color(0xFFF3F3F6),
                          child: Icon(
                            Icons.close,
                            size: 15.r,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomeTextField(
                    hintText: "Enter your subject",
                    controller: _leadDetailsController.subTextCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomeTextField(
                    hintText: "Enter your message",
                    maxLines: 5,
                    controller: _leadDetailsController.messageTextCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      Uri uri = Uri(
                          scheme: 'mailto',
                          path: leadData.user.email,
                          query: _leadDetailsController
                              .encodeQueryParameters(<String, String>{
                            'subject': _leadDetailsController.subTextCtrl.text,
                            'body': _leadDetailsController.messageTextCtrl.text
                          }));
                      _leadDetailsController.sendLaunchUrl(uri: uri);
                      // if (_formKey.currentState!.validate()) {
                      //   _leadDetailsController.sendEmail(
                      //       postId: leadData.id,
                      //       sub: _leadDetailsController.subTextCtrl.text,
                      //       message:
                      //           _leadDetailsController.messageTextCtrl.text,
                      //       userId: leadData.user.id);
                      // }
                    },
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send email',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Obx(
                            () => SizedBox(
                              width: _leadDetailsController
                                      .isSendEmailLoading.value
                                  ? 15.w
                                  : 0,
                            ),
                          ),
                          Obx(() {
                            if (_leadDetailsController
                                .isSendEmailLoading.value) {
                              return SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
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
                  ),
                ],
              ),
            ),
          ));

  _sendSmsTemplete(BuildContext context) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: const Color(0xFFF3F3F6),
                        child: Icon(
                          Icons.close,
                          size: 15.r,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "Use a template",
                  style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Select your template to send to Mark",
                  style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                  () => SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount:
                            _leadDetailsController.smsTemplateList.length,
                        itemBuilder: (context, index) {
                          var data =
                              _leadDetailsController.smsTemplateList[index];
                          return InkWell(
                            onTap: () {
                              _leadDetailsController.isSelectSmsTemplete.value =
                                  index;
                            },
                            child: Obx(
                              () => Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(vertical: 3.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: _leadDetailsController
                                                  .isSelectSmsTemplete.value ==
                                              index
                                          ? themeColorGreen
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Text(
                                  data.templateName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp, color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    Uri uri = Uri(
                        scheme: 'sms',
                        path: leadData.user.phoneNumber,
                        queryParameters: <String, String>{
                          'body': Uri.encodeComponent(_leadDetailsController
                              .smsTemplateList[_leadDetailsController
                                  .isSelectSmsTemplete.value]
                              .message)
                        });
                    _leadDetailsController.sendLaunchUrl(uri: uri);
                    // _leadDetailsController.sendEmail(
                    //     postId: leadData.id,
                    //     sub: _leadDetailsController
                    //         .emailTemplateList[
                    //             _leadDetailsController.isSelectTemplete.value]
                    //         .templateName,
                    //     message: _leadDetailsController
                    //         .emailTemplateList[
                    //             _leadDetailsController.isSelectTemplete.value]
                    //         .message,
                    //     userId: leadData.user.id);
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFF187949),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Send Sms',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Obx(
                          () => SizedBox(
                            width:
                                _leadDetailsController.isSendEmailLoading.value
                                    ? 15.w
                                    : 0,
                          ),
                        ),
                        Obx(() {
                          if (_leadDetailsController.isSendEmailLoading.value) {
                            return SizedBox(
                              height: 15.sp,
                              width: 15.sp,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
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
                ),
              ],
            ),
          ));

  _sendCustomSms(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: const Color(0xFFF3F3F6),
                          child: Icon(
                            Icons.close,
                            size: 15.r,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomeTextField(
                    hintText: "Enter your message",
                    maxLines: 5,
                    controller: _leadDetailsController.smsTextCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field is Empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  InkWell(
                    onTap: () {
                      Uri uri = Uri(
                          scheme: 'sms',
                          path: leadData.user.phoneNumber,
                          queryParameters: <String, String>{
                            'body': Uri.encodeComponent(_leadDetailsController.smsTextCtrl.text)
                          });
                      _leadDetailsController.sendLaunchUrl(uri: uri);
                      // if (_formKey.currentState!.validate()) {
                      //   _leadDetailsController.sendEmail(
                      //       postId: leadData.id,
                      //       sub: _leadDetailsController.subTextCtrl.text,
                      //       message:
                      //           _leadDetailsController.messageTextCtrl.text,
                      //       userId: leadData.user.id);
                      // }
                    },
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(4.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send Sms',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Obx(
                            () => SizedBox(
                              width: _leadDetailsController
                                      .isSendEmailLoading.value
                                  ? 15.w
                                  : 0,
                            ),
                          ),
                          Obx(() {
                            if (_leadDetailsController
                                .isSendEmailLoading.value) {
                              return SizedBox(
                                height: 15.sp,
                                width: 15.sp,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3,
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
                  ),
                ],
              ),
            ),
          ));

  customeText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF424242)),
    );
  }
}

