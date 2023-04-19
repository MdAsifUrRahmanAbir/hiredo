// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/OrderScreen/order_controller.dart';
import 'package:homelyknock/Screens/TrackingScreen/Model/pending_post_model.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

class OrderName extends StatefulWidget {
  const OrderName({super.key});

  @override
  State<OrderName> createState() => _OrderNameState();
}

class _OrderNameState extends State<OrderName> {
  PendingPostModel data = Get.arguments;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final _orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    _orderController.fetchRequestList(data.id);
   
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Order Name",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: data.user.userProfilePic == null
                ? Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                  )
                : Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image:
                                NetworkImage(data.user.userProfilePic!.picture),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Obx(
          () =>_orderController.isLoading.value?CustomLoader():SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF9CCDB5))),
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Showing all ${data.responseCount} request",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff424242)),
                          )),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 34,
                          width: 74,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: Color(0xff187949)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_list,
                                color: Color(0xffFFFFFF),
                                size: 20,
                              ),
                              Text(
                                "Filter",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 185.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                            image: NetworkImage(data.category.image),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    data.category.name,
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF272727)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  // Text(
                  //   'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                  //   style: GoogleFonts.roboto(
                  //       fontSize: 14.sp,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xFF555957)),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _orderController.requestList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data=_orderController.requestList[index];
                      return Container(
                        height: 147.h,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 15.h, left: 5.w),
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.profileName,
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF272727)),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEACA23),
                                  size:25.sp,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  data.rating.toString(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF424242)),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                // Text(
                                //   "(100)",
                                //   style: GoogleFonts.roboto(
                                //       fontSize: 14.sp,
                                //       fontWeight: FontWeight.w400,
                                //       color: Color(0xFF424242)),
                                // )
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            // Text('Total 500 work complete',
                            //     style: GoogleFonts.roboto(
                            //         fontSize: 14.sp,
                            //         fontWeight: FontWeight.w400,
                            //         color: Color(0xFF424242))),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if(_orderController.isAccept.value==0&&_orderController.isStatusLoading.value==false){
                                        _orderController.hendleAcceptAndReject(true, data.id.toString(),data.userId,index);
                                    }
                                  },
                                  child: Container(
                                    height: 34.h,
                                    width: 81.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF187949),
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    child: Obx(()=>
                                       Center(
                                        child:_orderController.isSelectIndex.value==index&&_orderController.isStatus.value==true&&_orderController.isStatusLoading.value?SizedBox(
                                          height: 10.h,
                                          width: 10.h,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                            color: Colors.white,
                                          ),
                                        ): Text(
                                         _orderController.isAccept.value==data.id? 'Accepted':"Accept",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFF2F2F2)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    bool isReJect=_orderController.isReject.contains(data.id);
                                    
                                    if(isReJect==false&&_orderController.isStatusLoading.value==false&&_orderController.isAccept.value!=data.id){
                                        _orderController.hendleAcceptAndReject(false, data.id.toString(),data.userId,index);
                                       
                                    }
                                    
                                  },
                                  child: Container(
                                    height: 34.h,
                                    width: 76.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF187949)),
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    child: Obx(()=>
                                       Center(
                                        child:_orderController.isSelectIndex.value==index&&_orderController.isStatus.value==false&&_orderController.isStatusLoading.value?SizedBox(
                                          height: 10.h,
                                          width: 10.h,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                            color:themeColorGreen,
                                          ),
                                        ): Text(
                                         _orderController.isReject.contains(data.id)?"Rejected" :'Reject',
                                          style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF424242)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 34.h,
                                    width: 140.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF187949)),
                                        borderRadius:
                                            BorderRadius.circular(3.r)),
                                    child: Center(
                                      child: Text(
                                        'View Conpany Profile',
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF424242)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15.h,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
