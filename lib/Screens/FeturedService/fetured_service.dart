import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HomeScreen/Model/lead_category_model.dart';
import '../JobPost/post_a_job.dart';
import '../QuestionScreen/question_screen.dart';

class FeturedServiceScreen extends StatelessWidget {
   FeturedServiceScreen({super.key,required this.data});

   List<LeadCategoriesModel> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25.sp,
          color: Color(0xff187949),
        )),
    title: Text(
      "Fetured Service",
      style: GoogleFonts.roboto(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff272727)),
    ),),
body:  GridView.builder( 
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 10.h),
           // physics: NeverScrollableScrollPhysics(),
            itemCount:data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 231.h,
                                  crossAxisSpacing:15.w,
                                  mainAxisSpacing: 15.h,
                                  crossAxisCount: 2), 
                                  itemBuilder: (context,index)=>itemContainer(data[index],index),
                                  ),


    );
    }
   itemContainer(LeadCategoriesModel data,int index) {
    return Container(
      padding:EdgeInsets.all(10.w),
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1)
          )
        ]
      ),
     
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
                  borderRadius: BorderRadius.circular(
                      10.r),
                  child: Image.network(
                    data.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 10.w,
                  top: 10.h,
                  child:const Icon(
                    Icons.favorite_border,
                    color: Color(0xFF187949),
                  ))
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(data.name,
              style: GoogleFonts.roboto(
                fontSize: 14.sp,
                color:const Color(0xFF272727),
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
          InkWell(
            onTap: (){
               
                   Get.to(PostAJob(selectIndex:index,));
              
            },
            child: Container(
              height: 30.h,
              width: 84.w,
              decoration: BoxDecoration(
                  color: Color(0xFF187949),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                child: Text(
                  'Post a Job',
                  style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
