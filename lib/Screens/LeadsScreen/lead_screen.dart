import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/widgets/custom_loader.dart';
import '../../Services/api_component.dart';
import '../LeadsDetailsScreen/Controller/lead_details_controller.dart';
import '../ProfileScreen/Controller/profile_controller.dart';
import 'package:jiffy/jiffy.dart';

import '../ProfileScreen/profile.dart';
import 'Controller/lead_controller.dart';

class LeadsScreen extends StatelessWidget {
  static const String routename = '/leadscreen';
  LeadsScreen({super.key});

  final _profileController = Get.put(ProfileController());
  final _leadController = Get.put(LeadController());
   final   _leadDetailsController=Get.put(LeadDetailsController());

  @override
  Widget build(BuildContext context) {
    _leadController.firstLoad();
    _leadDetailsController.isContect.clear();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Leads',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        actions: [Image.asset('images/notification.png')],
      ),
      body: Obx(
        () => _leadController.isFirstLoadRunning.value
            ? const CustomLoader()
            : ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
                controller: _leadController.scrolController,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: _leadController.searchController,
                            onChanged: (v){
                            if(v.isEmpty){
                              _leadController.isSearch.value=false;
                            }
                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.withOpacity(0.3),
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.green.withOpacity(0.3),
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          if(_leadController.searchController.text.isNotEmpty){
                             _leadController.isSearch.value=true;
                             _leadController.searchLeads();

                          }
                         

                        
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          height: 50.h,
                          color: const Color(0xff187949),
                          child: Row(
                            children: [
                              Text(
                                'Filter',
                                style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Icon(
                                Icons.filter_list_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 70.h,
                    padding:
                        EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(7.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${profileController.leadsCount.value} matching leads',
                              style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF272727)),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Image.asset('images/service.png'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  '${_profileController.serviceList.length} Services',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF454545)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 20.h,
                                  width: 1.w,
                                  color: const Color(0xFF187949),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Image.asset('images/location.png'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'Locations',
                                  style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF454545)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 77.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFF187949),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/edit.png',
                                color: const Color(0xFFFFFFFF),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'Edit',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFF2F2F2)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Showing all ${profileController.leadsCount.value} leads',
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF686868)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:_leadController.isSearch.value?_leadController.searchLeadList.length:_leadController.leadsList.length,
                    itemBuilder: (context, index) {
                      var data = _leadController.isSearch.value?_leadController.searchLeadList[index]:_leadController.leadsList[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.leadDetailsPage,arguments:data);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                data.user.userProfilePic == null
                                    ? CircleAvatar(
                                        radius: 20.r,
                                        backgroundColor: Colors.grey.shade400,
                                      )
                                    : CircleAvatar(
                                        radius: 20.r,
                                        backgroundImage: NetworkImage(
                                            "$baseUrl${data.user.userProfilePic!.picture}"),
                                      ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data.user.fullName,
                                            style: GoogleFonts.roboto(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFF272727)),
                                          ),
                                          SizedBox(
                                            width: 30.w,
                                          ),
                                          Image.asset('images/run.png'),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            data.category.name,
                                            style: GoogleFonts.roboto(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF424242),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset("images/location.png"),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            data.location,
                                            style: GoogleFonts.roboto(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Container(
                                  height: 27.h,
                                  width: 77.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFE8FAF1),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_rounded,
                                        color: const Color(0xFF187949),
                                        size: 18.sp,
                                      ),
                                      Expanded(
                                        child: Text(
                                          Jiffy.parse(data.created).fromNow(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF187949)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  text: 'Additional Details:',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF187949)),
                                  children: data.postObject
                                      .map((e) => TextSpan(
                                          text: e.question.qs,
                                          style: GoogleFonts.roboto(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF848484))))
                                      .toList(),
                                )),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Image.asset("images/b.png"),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "${data.postCredit} Credits",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            const Divider(
                              color: Color(0xFF424242),
                            )
                          ],
                        ),
                      );
                    },
                    
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 25.h,
                      );
                    },
                  )
                ,
                  if (_leadController.isLoadMoreRunning.value == true)
               Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 40.h),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
                
                
                
                
                
                
                ],
              ),
      ),
    );
  }
}
