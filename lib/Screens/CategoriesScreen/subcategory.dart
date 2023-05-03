// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructor, prefer_const_constructors, avoid_unnecessary_containers, unused_field

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../Route/routes.dart';
import '../../utils/colors.dart';
import '../HomeScreen/Controller/home_controller.dart';
import '../HomeScreen/Model/lead_category_model.dart';
import '../JobPost/post_a_job.dart';
import 'Controller/sub_categories_controller.dart';

class SubCategoryPage extends StatelessWidget {
  SubCategoryPage(
      {super.key, });
   
     

      


  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();

  final _homeController = Get.put(HomeController());

  final _subCatController=Get.put(SubCategorisController());

  @override
  Widget build(BuildContext context) {
      final String name = Get.arguments['name'];
    _subCatController.demoList.value=Get.arguments['subCategory'];
    _subCatController.subcategory.value=Get.arguments['subCategory'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xff187949),
            )),
        title: Text(
           name
        ,
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Container(
        //       height: 40,
        //       width: 40,
        //       decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: AssetImage("images/img2.png"), fit: BoxFit.cover),
        //           shape: BoxShape.circle),
        //     ),
        //   )
        // ],
        automaticallyImplyLeading: false,
      ),
      body:Get.arguments['subCategory'].isEmpty
          ? Center(
              child: Text(
              "There are no sub-categories",
              style: TextStyle(color: Colors.red),
            ))
          : 
             SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // <------------ drop down ---------->
          
                    // Padding(
                    //   padding: EdgeInsets.only(left: 20, right: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(20.0),
                    //         child: DropdownButtonHideUnderline(
                    //           child: DropdownButton2(
                    //             isExpanded: true,
                    //             hint: Row(
                    //               children: [
                    //                 SizedBox(
                    //                   width: 4,
                    //                 ),
                    //                 Expanded(
                    //                   child: Text(
                    //                     'Sub Categories',
                    //                     style: GoogleFonts.roboto(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w500,
                    //                       letterSpacing: 1,
                    //                       color: Color(0xffF2F2F2),
                    //                     ),
                    //                     overflow: TextOverflow.ellipsis,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             items: items
                    //                 .map((item) => DropdownMenuItem<String>(
                    //                       value: item,
                    //                       child: Text(
                    //                         item,
                    //                         style: GoogleFonts.roboto(
                    //                           fontSize: 14,
                    //                           fontWeight: FontWeight.w500,
                    //                           letterSpacing: 1,
                    //                           color: Color(0xffF2F2F2),
                    //                         ),
                    //                         overflow: TextOverflow.ellipsis,
                    //                       ),
                    //                     ))
                    //                 .toList(),
                    //             value: selectedValue,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 selectedValue = value as String;
                    //               });
                    //             },
                    //             icon: Icon(
                    //               Icons.arrow_drop_down,
                    //             ),
                    //             iconSize: 14,
                    //             iconEnabledColor: Color(0xffF2F2F2),
                    //             iconDisabledColor: Colors.grey,
                    //             buttonHeight: 36,
                    //             buttonWidth: 207,
                    //             buttonPadding: EdgeInsets.only(left: 14, right: 14),
                    //             buttonDecoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(4),
                    //               color: Color(0xff187949),
                    //             ),
                    //             buttonElevation: 2,
                    //             itemHeight: 40,
                    //             itemPadding: EdgeInsets.only(left: 14, right: 14),
                    //             dropdownMaxHeight: 200,
                    //             dropdownWidth: 200,
                    //             dropdownPadding: null,
                    //             dropdownDecoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(4),
                    //               color: Color(0xff187949),
                    //             ),
                    //             dropdownElevation: 8,
                    //             scrollbarRadius: Radius.circular(4),
                    //             scrollbarThickness: 6,
                    //             scrollbarAlwaysShow: true,
                    //             offset: Offset(-20, 0),
                    //           ),
                    //         ),
                    //       ),
          
                    //       Container(
                    //         height: 36,
                    //         width: 68,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(3),
                    //             color: Color(0xff187949)),
                    //         child: Center(
                    //           child: Text(
                    //             "Filter",
                    //             style: GoogleFonts.roboto(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xffF2F2F2),
                    //                 letterSpacing: 1),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
          
                
                
                    // <------------ search section ---------->
          
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50.h,
                              child: TextField(
                                controller: nameController,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                   _subCatController.demoList.value = _subCatController.subcategory;
                                  }
                                },
                                decoration: InputDecoration(
                                  
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.r),
                                          bottomLeft: Radius.circular(3.r)),
                                      borderSide:
                                          BorderSide(color: Color(0xff9CCDB5))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3.r),
                                          bottomLeft: Radius.circular(3.r)),
                                      borderSide:
                                          BorderSide(color: Color(0xff9CCDB5))),
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
                          GestureDetector(
                            onTap: () {
                             _subCatController.searchSubCategory(nameController.text);
                            },
                            child: Container(
                              height: 50.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: Color(0xff187949),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(3.r),
                                    bottomRight: Radius.circular(3.r)),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
          


          
                    SizedBox(
                      height: 20,
                    ),
          
                    Obx(()=>
                       ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            LeadCategoriesModel data = _subCatController.demoList[index];
                            return Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF1879490d).withOpacity(0.05),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              height: 94.h,
                              width: 376.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.sp, vertical: 14.sp),
                              child: Row(
                                children: [
                                  data.image == null
                                      ? CircleAvatar(
                                          maxRadius: 35.r,
                                          backgroundColor: Color(0xffE8F2ED),
                                          child: Icon(
                                            Icons.face,
                                            color: Color(0xff187949),
                                          ),
                                        )
                                      : CircleAvatar(
                                          maxRadius: 35.r,
                                          backgroundColor: Color(0xffE8F2ED),
                                          backgroundImage:
                                              NetworkImage(data.image!),
                                        ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.name,
                                        style: GoogleFonts.roboto(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff187949)),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "${data.popularity.toString()}${data.popularity < 100 ? "" : "+"} Company work",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff555957)),
                                      ),
                                    ],
                                  )),
                                  Obx(()=>
                       IconButton(
                        onPressed: () {
                          if(_homeController.wishList.contains(data.id)){
                               //     _homeController.removeWishList(data.id);
                          }else{
                            _homeController.addWishList(data.id);
                                  
                          }
                          
                         
                        },
                        icon:_homeController.wishList.contains(data.id)?Icon(
                          Icons.favorite,
                          color: Color(0xFF174E31),
                        ): Icon(
                          Icons.favorite_border,
                          color: Color(0xFF187949),
                        ),
                      ),
                    ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       Icons.favorite_border,
                                  //       color: Color(0xFF187949),
                                  //     )),
                                  InkWell(
                                    onTap: () {
                                     
                                       Get.toNamed(Routes.postAJob,arguments:{
                                        "isBookId":null,
                                        "category":data
                                       }); 
                                     
                                      
                                    },
                                    child: Container(
                                      height: 34.h,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: themeColorGreen,
                                          borderRadius: BorderRadius.circular(3.r)),
                                      child: Text(
                                        "Post a job",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                              
                          //  Container(
                          //       color: Color(0xffFFFFFF),
                          //       margin: EdgeInsets.only(left: 10, right: 10),
                          //       height: 94,
                          //       width: 376,
                          //       child: Card(
                          //         child: ListTile(
                          //           leading: CircleAvatar(
                          //             maxRadius: 30,
                          //             backgroundColor: Color(0xffE8F2ED),
                          //             child: Icon(
                          //               Icons.free_breakfast,
                          //               color: Color(0xff187949),
                          //             ),
                          //           ),
                          //           title: Text(
                          //             "House Cleaning",
                          //             style: GoogleFonts.roboto(
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.w500,
                          //                 color: Color(0xff187949)),
                          //           ),
                          //           subtitle: Text(
                          //             "100+ company work",
                          //             style: GoogleFonts.roboto(
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w400,
                          //                 color: Color(0xff424242)),
                          //           ),
                          //           trailing: InkWell(
                          //             onTap: () {},
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(3),
                          //                 color: Color(0xff187949),
                          //               ),
                          //               height: 30,
                          //               width: 60,
                          //               child: Center(
                          //                   child: Text(
                          //                 "service",
                          //                 style: GoogleFonts.roboto(
                          //                     fontSize: 12,
                          //                     fontWeight: FontWeight.w500,
                          //                     color: Color(0xffFFFFFF),
                          //                     letterSpacing: 1),
                          //               )),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                              
                          separatorBuilder: (_, index) => SizedBox(
                                height: 10,
                              ),
                          itemCount: _subCatController.demoList.length),
                    )
                  ],
                ),
            
              ),
          
    );
  }
}
