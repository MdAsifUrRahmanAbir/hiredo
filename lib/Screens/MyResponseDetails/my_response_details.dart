import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homelyknock/Screens/ResistrationScreen/component/custom_button.dart';
import 'package:homelyknock/Screens/ResistrationScreen/component/custome_text_field.dart';
import 'package:homelyknock/Services/api_component.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';
import 'package:jiffy/jiffy.dart';

import '../MyResponse/Model/my_response_model.dart';
import 'Controller/my_response_details_controller.dart';

class MyresponseDetailsScreen extends StatelessWidget {
  MyresponseDetailsScreen({
    super.key,
  });

  Result leadData = Get.arguments;
  final _mydetailsController =Get.put(MyresponseDetailesController());
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _mydetailsController.getEmailTemplete();
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
          leading: leadData.posts.user.userProfilePic == null
              ? CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey.shade400,
                )
              : CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                      "$baseUrl${leadData.posts.user.userProfilePic.picture}"),
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
      body: Obx(()=>_mydetailsController.isLoading.value?const CustomLoader():
         SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 17.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    leadData.posts.category.name,
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
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        Jiffy.parse(leadData.posts.created)
                                            .fromNow(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF187949)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // ListTile(
      
                            Row(
                              children: [
                                Image.asset(
                                  "images/location.png",
                                  height: 15.h,
                                  width: 11.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  leadData.posts.location,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF424242)),
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
                            color: Color(0xFF187949),
                            size: 20.sp,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            leadData.posts.user.phoneNumber,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Container(
                            height: 12.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFE8FAF1),
                                borderRadius: BorderRadius.circular(3.r)),
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
                          Text(
                            leadData.posts.user.email,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
      
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showNumber(context);
                            },
                            child: Container(
                              height: 50.h,
                              width: 148.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF187949),
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Center(
                                child: Text(
                                  'Show Contact',
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
                          InkWell(
                            onTap: () {
                              _sendEmail(context);
                            },
                            child: Container(
                              height: 50.h,
                              width: 148.w,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: const Color(0xFF187949)),
                                  borderRadius: BorderRadius.circular(5.r)),
                              child: Center(
                                child: Text(
                                  'Send email',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF187949)),
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
                            "${leadData.posts.postCredit} Credits",
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
                      // if(_leadDetailsController.isContect.contains(leadData.id))
                      // _contactVisiable(context),
      
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
                        color: const Color(0xFF848484).withOpacity(0.05),
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
                          final qansData = leadData.posts.postObject[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                        itemCount: leadData.posts.postObject.length,
                        separatorBuilder: (BuildContext context, int index) =>
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
                SizedBox(
                  height: 200.h,
                  child: GoogleMap(
                    rotateGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    liteModeEnabled: false,
                    tiltGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(double.parse(leadData.posts.latitude),
                            double.parse(leadData.posts.latitude))),
                    onMapCreated: (GoogleMapController controller) {},
                  ),
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

  _sendEmail(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
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
                ListTile(
                  onTap: (){  
                    _sendEmailTemplete(context);
                  },
                  leading: Icon(Icons.email,size:25.sp,color:Colors.grey,),
                  title:  Text(
                      "Use email template",
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                
                ),
                 ListTile(
                  onTap: (){  
                    _sendCustomEmail(context);
                  },
                  leading: Icon(Icons.edit_document,size:25.sp,color:Colors.grey,),
                  title:  Text(
                      "Send custom email",
                      style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                
                )
            
            
            
              ],
            ),
          ));

 _sendEmailTemplete(BuildContext context) => showDialog(context: context, builder: (_)=>AlertDialog(
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
       Row(
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
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
      Text("Use a template",style: GoogleFonts.roboto(fontSize:18.sp,fontWeight: FontWeight.w700,color: Colors.black),),
      SizedBox(height: 5.h,),
       Text("Select your template to send to Mark",style: GoogleFonts.roboto(fontSize:15.sp,fontWeight: FontWeight.w400,color: Colors.grey),)
        ,SizedBox(height: 10.h,),

    Obx(()=>
       SizedBox(
        height:250.h,
        width: double.infinity,
        child: ListView.builder(
         itemCount: _mydetailsController.emailTemplateList.length,
        
          itemBuilder: (context,index){
            var data=_mydetailsController.emailTemplateList[index];
            return InkWell(
              onTap: (){
                _mydetailsController.isSelectTemplete.value=index;
              },
              child: Obx(()=>
                 Container(
                  width: double.infinity,
                  
                  margin: EdgeInsets.symmetric(vertical:3.h),
                  padding: EdgeInsets.symmetric(horizontal:18.w,vertical:15.h),
                  decoration: BoxDecoration(
                    border: Border.all(color:_mydetailsController.isSelectTemplete.value==index?themeColorGreen: Colors.grey,),
                    borderRadius: BorderRadius.circular(5.r)
                  ),
                  child: Text(data.templateName,style: GoogleFonts.roboto(fontSize:16.sp,color: Colors.black),),
                  
                ),
              ),
            );
    
        }),
    
      ),
    ),
    SizedBox(height: 10.h,),
          InkWell(
                      onTap: () {
                        
                          _mydetailsController.sendEmail(postId:leadData.posts.id, sub:_mydetailsController.emailTemplateList[_mydetailsController.isSelectTemplete.value].templateName, message:_mydetailsController.emailTemplateList[_mydetailsController.isSelectTemplete.value].message, userId: leadData.user.id);
                        
                        
                       
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
                                    _mydetailsController.isSendEmailLoading.value ? 15.w : 0,
                              ),
                            ),
                            Obx(() {
                              if ( _mydetailsController.isSendEmailLoading.value) {
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

   _sendCustomEmail(BuildContext context) => showDialog(context: context,
     barrierDismissible: false,
    builder:(_)=>AlertDialog(
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
                             SizedBox(height:15.h,),
           CustomeTextField(
            hintText:"Enter your subject",
            controller: _mydetailsController.subTextCtrl,
             validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field is Empty';
                          } 
                          return null;
                        },
           
           ),
                    SizedBox(height:15.h,),
           CustomeTextField(
            hintText:"Enter your message",
            maxLines:5,
            controller: _mydetailsController.messageTextCtrl,
             validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field is Empty';
                          } 
                          return null;
                        },
           ),
           SizedBox(height:15.h,),
                   InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _mydetailsController.sendEmail(postId:leadData.posts.id, sub:_mydetailsController.subTextCtrl.text, message:_mydetailsController.messageTextCtrl.text, userId: leadData.user.id);
                        
                        }

                       
 
                       
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
                                    _mydetailsController.isSendEmailLoading.value ? 15.w : 0,
                              ),
                            ),
                            Obx(() {
                              if ( _mydetailsController.isSendEmailLoading.value) {
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
                      onTap: (){
                        _mydetailsController.sendLaunchUrl(uri:Uri.parse("tel:${leadData.user.phoneNumber}"));
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
