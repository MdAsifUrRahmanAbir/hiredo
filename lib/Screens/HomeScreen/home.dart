// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Screens/CategoriesScreen/categories.dart';
import 'package:myapp/Screens/HomeScreen/Controller/home_controller.dart';
import 'package:myapp/Screens/SearchResultScreen/catsearchpage.dart';

import 'package:myapp/Screens/LocationScreen/locationpage.dart';
import 'package:myapp/widgets/custom_loader.dart';


import '../FeturedService/fetured_service.dart';
import 'Model/lead_category_model.dart';

class Home extends StatelessWidget {
   Home({super.key});

 final GlobalKey<FormState> _formKey = GlobalKey();
final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
      //  appBar: _appBarWidget(),
        body:Obx(() =>_homeController.isLoading.value?CustomLoader(): _bodyWidget(context)),
      ),
    );
  }

 _bodyWidget(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height:23.h,),
        //<------------- discover text line------------>
           Padding(
             padding:EdgeInsets.symmetric(horizontal:17.w),
             child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover",
                      style: GoogleFonts.roboto(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          color: Color(0xff2E2E2E)),
                    ),
                    Text(
                      "Find the best one",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1,
                          color: Color(0xff2E2E2E)),
                    ),
                  ],
                ),
           ),
       
       


//<------------- Search Box ------------>
        Padding(
          padding:EdgeInsets.only(left: 17.w, right: 17.w, top: 32.h),
          child: IntrinsicHeight(
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
                        onTap: () {
                          print('click');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SearchResult()));
                        },
                        controller:_homeController.nameController,
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
                      padding: EdgeInsets.all(5.w),
                      child: TextFormField(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LocationPage()));
                        },
                        controller: _homeController.locationController,
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
                    onTap: () {},
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
        ),
      
      
      
      
      
      
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
             SizedBox(
              height: 147.h,
            ),
            // Stack(
            //   children: [
            //     AspectRatio(
            //       aspectRatio: 3,
            //       child: CarouselSlider(
            //           items: _homeController.carouselImages
            //               .map((item) => Padding(
            //                     padding: EdgeInsets.only(
            //                         left: 3.w, right: 3.w),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                           image: DecorationImage(
            //                               image: NetworkImage(item),
            //                               fit: BoxFit.fitWidth)),
            //                     ),
            //                   ))
            //               .toList(),
            //           options: CarouselOptions(
            //               autoPlay: true,
            //               enlargeCenterPage: true,
            //               viewportFraction: 1.2,
            //               enlargeStrategy:
            //                   CenterPageEnlargeStrategy.height,
            //               onPageChanged:
            //                   (val, carouselPageChangedReason) {
                            
            //                   _homeController.dotPosition = val;
                          
            //               })),
            //     ),
            //     Positioned(
            //       left: 50.w,
            //       right: 50.w,
            //       bottom: 5.w,
            //       child: DotsIndicator(
            //         dotsCount: _homeController.carouselImages.length == 0
            //             ? 1
            //             : _homeController.carouselImages.length,
            //         position: _homeController.dotPosition.toDouble(),
            //         decorator: DotsDecorator(
            //           activeColor: Color(0xff187949),
            //           color: Color(0xff174E31),
            //           spacing: EdgeInsets.all(2),
            //           activeSize: Size(8, 8),
            //           size: Size(6, 6),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //         top: 20.h,
            //         left: 15.w,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               "order any service,Anytime",
            //               style: GoogleFonts.roboto(
            //                   fontSize: 14.sp,
            //                   fontWeight: FontWeight.w400,
            //                   color: Color(0xff555957)),
            //             ),
            //             Text(
            //               "We Provide High Quality",
            //               style: GoogleFonts.roboto(
            //                 fontSize: 20.sp,
            //                 fontWeight: FontWeight.w600,
            //                 color: Color(0xff555957),
            //               ),
            //             ),
            //             Row(
            //               children: [
            //                 Text(
            //                   "Professional",
            //                   style: GoogleFonts.roboto(
            //                     fontSize: 20.sp,
            //                     fontWeight: FontWeight.w600,
            //                     color: Color(0xff555957),
            //                   ),
            //                 ),
            //                 Text(
            //                   " Service",
            //                   style: GoogleFonts.roboto(
            //                     fontSize: 20.sp,
            //                     fontWeight: FontWeight.w600,
            //                     color: Color(0xff187949),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         )),
            //     Positioned(
            //         left: 310.w,
            //         top: 5.h,
            //         child: Container(
            //           height: 40.h,
            //           width: 40.w,
            //           decoration: BoxDecoration(
            //               image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            //                   fit: BoxFit.cover),
            //               shape: BoxShape.circle),
            //         )),
            //     Positioned(
            //         left: 240.w,
            //         top: 15.h,
            //         child: Container(
            //           height: 50.h,
            //           width: 50.w,
            //           decoration: BoxDecoration(
            //               image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            //                   fit: BoxFit.cover),
            //               shape: BoxShape.circle),
            //         )),
            //     Positioned(
            //         left: 275.w,
            //         top: 30.h,
            //         child: Container(
            //           height: 70.h,
            //           width: 70.w,
            //           decoration: BoxDecoration(
            //               image: DecorationImage(
            //                   image: NetworkImage(
            //                       "https://s3-alpha-sig.figma.com/img/a2db/ea11/1db87c4614efa54373265ae109bf347a?Expires=1678665600&Signature=EfMJzPDGBr57IMplZ2GIZJjvYR8vlGZ3FQsYMYffKfuP3zubzc2NxNrBSb0BJxaexL591ceC2euz2pAIrjibqQwsGJbyC6cpFgZpIMYP4IwxlWg9cvL9QmWbmMur4yc0W42kypHCHxB1fnhWL2xdUHneBNcmO9qiF56Cad7kbzf40Z1NstVDGRAjXAtr9LwSs95YWbTyk0-G6PjuUvOj1b~otJEn4ETMEYxiIkhIYo~Dg~iuCYF~ftWpZTXHYsoQ6oV66wGVrIBUse9RaQx9WW3X-TAVJHWI4Ui8UF7ySLBqPShMPuYVvKMnkrKjPC4QR6t2sHtHiNen97~-9f9OIQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            //                   fit: BoxFit.cover),
            //               shape: BoxShape.circle),
            //         ))
            //   ],
            // ),
          


//<-------------Our Categories------------>

            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 20.h, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Our Categories",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff555957),
                        letterSpacing: 1),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoriesPage(allCategories: _homeController.categoryList,)));
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff187949),
                          letterSpacing: 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120.h,
              width:double.infinity,
              child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:_homeController
                            .categoryList.length>10?10:_homeController
                            .categoryList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var result = _homeController
                              .categoryList[index];
                          return Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              children: [
                                result.image.isEmpty?
                                CircleAvatar(
                                  backgroundColor:
                                      Color(0xffD9F1E5),
                                  radius: 25.r,
                                  child: Icon(
                                    Icons.face,
                                    color: Colors.grey,
                                  ),
                                ):CircleAvatar(
                                 backgroundImage:NetworkImage(result.image),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  result.name,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff555957),
                                      letterSpacing: 1),
                                )
                              ],
                            ),
                          );
                        }),
              ),
            
          
          
          //<------------- Fetured Service   ------------>
          
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 20.h, bottom: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fetured Service",
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff555957),
                        letterSpacing: 1),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>FeturedServiceScreen(data :_homeController.subCategoryList)));
                    },
                    child: Text(
                      "See All",
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff187949),
                          letterSpacing: 1),
                    ),
                  ),
                ],
              ),
            ),
          GridView.builder( 
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal:17.w,vertical: 10.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount:_homeController.subCategoryList.length>2?2:_homeController.subCategoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 231.h,
                                  crossAxisSpacing:15.w,
                                  mainAxisSpacing: 15.h,
                                  crossAxisCount: 2), 
                                  itemBuilder: (context,index)=>itemContainer(_homeController.subCategoryList[index]),
                                  ),
            
          ],
        ),
      ],
    );
  }




   itemContainer(LeadCategoriesModel data) {
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
            offset: Offset(0, 1)
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
                    data.image,
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
          Text(data.name,
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
                'Post a Job',
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
