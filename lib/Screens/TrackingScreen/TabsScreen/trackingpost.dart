// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/OrderScreen/ordername.dart';

import 'package:homelyknock/widgets/custom_loader.dart';

import '../Controller/pending_controller.dart';

class TrackingPostOrder extends StatelessWidget {
  TrackingPostOrder({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final _pendingPostontroller = Get.put(PendingController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
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
      SizedBox(
        height: 20.h,
      ),
      Obx(()=> _pendingPostontroller.isLoading.value? CustomLoader()
        : 
        
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var result = _pendingPostontroller.pendingPostModel[index];
              return   Container(
                  color: Color(0xffFFFFFF),
                  height: 171.h,
                  width: 375.w,
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 89.h,
                              width: 80.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3.r),
                                child: result.category == null?Container(
                                  color: Colors.pink,
                                ):
                                Image.network(result.category!.image)
                              ),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 20.h,
                                  right: 5.w,
                                  left: 10.w,
                                  bottom: 10.w),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  result.category == null?Text(''):
                                  Text(
                                    result.category!.name,
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff272727)),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  result.category == null?Text(''):
                                  Text(
                                    result.category!.popularity.toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff272727)),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    result.responseCount.toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff272727)),
                                  ),
                                
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     InkWell(
                                  //       onTap: () {
                                  //         Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (_) =>
                                  //                     OrderName()));
                                  //       },
                                  //       child: Container(
                                  //         height: 34.h,
                                  //         width: 115.w,
                                  //         decoration: BoxDecoration(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(
                                  //                     4.r),
                                  //             color: Color(0xff187949)),
                                  //         child: Center(
                                  //           child: Text(
                                  //             "view details",
                                  //             style: GoogleFonts.roboto(
                                  //                 fontSize: 14.sp,
                                  //                 fontWeight:
                                  //                     FontWeight.w400,
                                  //                 color: Colors.white),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Container(
                                  //       height: 34.h,
                                  //       width: 80.w,
                                  //       decoration: BoxDecoration(
                                  //           borderRadius:
                                  //               BorderRadius.circular(4.r),
                                  //           border: Border.all(
                                  //               color: Color(0xff0187949)),
                                  //           color: Colors.white),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //         children: [
                                  //           Image.asset(
                                  //             'images/edit.png',
                                  //             color: Color(0xFF187949),
                                  //           ),
                                  //           SizedBox(
                                  //             width: 8.w,
                                  //           ),
                                  //           Text(
                                  //             "Edit",
                                  //             style: GoogleFonts.roboto(
                                  //                 fontSize: 14.sp,
                                  //                 fontWeight:
                                  //                     FontWeight.w400,
                                  //                 color: Color(0xFF187949)),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                               
                               
                               
                                ],
                              ),  
                            )),
                      ],
                    ),
                  ),
                );
           
            },
            
          
            separatorBuilder: (_, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: _pendingPostontroller.pendingPostModel.length),
        
      )
    ],
      ),
    );
  }
}
