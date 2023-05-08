// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:shimmer/shimmer.dart';


import '../../../Services/api_component.dart';
import '../../../utils/colors.dart';
import '../../BuyerBookingCompleteDetails/buyerbooking_complete_details.dart';
import '../Controller/complete_controller.dart';

class TrackingPostOrderTwo extends StatelessWidget {
  TrackingPostOrderTwo({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final _completePostController=Get.put(CompletePostController());

  @override
  Widget build(BuildContext context) {
    _completePostController.fetchCompletePost();
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Obx(()=>
         Column(
          children: [
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
                          onChanged: (value){
                              if (nameController.text.isEmpty &&
                                locationController.text.isEmpty) {
                              _completePostController.completePostList.value =
                                  _completePostController.demoCompletePostList;
                            }
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Search ",
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Color(0xffB7B7B7)),
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
                          onChanged: (value){
                              if (nameController.text.isEmpty &&
                                locationController.text.isEmpty) {
                              _completePostController.completePostList.value =
                                  _completePostController.demoCompletePostList;
                            }
                          },
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
                                color: Color(0xffB7B7B7)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                         _completePostController.searchPanddingPost(
                            text: nameController.text.trim(),
                            location: locationController.text.trim());
                      },
                      child: Container(
                        color: Color(0xff187949),
                        height: 50.h,
                        width: 45.w,
                        child: Icon(
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
              height: 20.h,
            ),
            if(_completePostController.completePostList.isNotEmpty)
            _completePostController.isLoading.value?ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 89.h,
                                  width: 80.w,
                                  color: Colors.white,
                                ),
                                title: Container(
                                  height: 15.h,
                                  width: 100.w,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: double.infinity,
                                  height: 15.h,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  
                  :
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data=_completePostController.completePostList[index];
                    return Container(
                        height: 171.h,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xFF187949).withOpacity(0.07),
                                  blurRadius: 7,
                                  spreadRadius: 0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.r),
                                  child: Image.network(
                                    baseUrl+data.post.category.image,
                                    height: 89.h,
                                    width: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.post.category.name,
                                          style: GoogleFonts.roboto(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF272727)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        data.post.postObject[0].question.qs,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF555957)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Completed by ',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF848484)),
                                          children: [
                                            TextSpan(
                                                text:data.profileName,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF272727))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
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
                                SizedBox(
                                  width: 90.w,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.completePostDetails,arguments: data);
                                  },
                                  child: Container(
                                    height: 34.h,
                                    width: 115.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.r),
                                        color: Color(0xff187949)),
                                    child: Center(
                                      child: Text(
                                        "view details",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                
                  },
                
                
                
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: _completePostController.completePostList.length),
            )
          ,
          SizedBox(height: 8.h,),
           _completePostController.isLoading.value?ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 89.h,
                                  width: 80.w,
                                  color: Colors.white,
                                ),
                                title: Container(
                                  height: 15.h,
                                  width: 100.w,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  width: double.infinity,
                                  height: 15.h,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      })
                  
                  :
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                     var data=_completePostController.buyerCompleteBookNowList[index];
                    return Container(
                        height: 171.h,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0xFF187949).withOpacity(0.07),
                                  blurRadius: 7,
                                  spreadRadius: 0)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.r),
                                  child: Image.network(
                                    data.category.image,
                                    height: 89.h,
                                    width: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.category.name,
                                          style: GoogleFonts.roboto(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF272727)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                      data.realtimePostObject[0].question.qs,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF555957)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Completed by ',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF848484)),
                                          children: [
                                            TextSpan(
                                                text:data.bookedInUser.fullName,
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF272727))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
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
                                SizedBox(
                                  width: 90.w,
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(CompleteBuyerBookingDetails(data:data,));
                                   
                                  },
                                  child: Container(
                                    height: 34.h,
                                    width: 115.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.r),
                                        color: Color(0xff187949)),
                                    child: Center(
                                      child: Text(
                                        "view details",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                
                  },
                
                
                
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount:_completePostController.buyerCompleteBookNowList.length),
            )
          ,
              SizedBox(height: 20.h,),

           _completePostController.isLoading.value?SizedBox(): InkWell(
              onTap: (){
                 Get.toNamed(Routes.postAJob, arguments:{ "isBookId":null,
                                        "category":null});
              },
              child: Container(height: 50.h,
                      width:double.infinity,
                      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: themeColorGreen,
              
                      ),
                      alignment: Alignment.center,
                      child: Text("Add a new job post",style: GoogleFonts.roboto(fontSize:16.sp,fontWeight: FontWeight.w500,color: Colors.white),),
                      
                      
                      ),
            ),

            SizedBox(height: 80.h,)
            
             
          
          
          
          ],
        ),
      ),
    );
  }
}
