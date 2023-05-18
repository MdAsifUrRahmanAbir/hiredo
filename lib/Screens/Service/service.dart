
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Route/routes.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';




import '../ProfileScreen/profile.dart';
import 'Controller/service_controller.dart';


class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});
 
   // final _profileController = Get.put(ProfileController());
     final _serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    debugPrint(profileController.serviceList.length.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Service',
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
      ),
      body: SafeArea(
        child: Obx(()=>_serviceController.isLoading.value?const CustomLoader():
           SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child:    Obx(()=>
               Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Total Service : ${profileController.serviceList.length}",
                        style: GoogleFonts.roboto(
                            fontSize: 18.sp, fontWeight: FontWeight.w700),
                      )),
                      _addService(context)
                    ],
                  ),
               
                     ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileController.serviceList.length,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: const Color(0xFF000000).withOpacity(0.1),
                                  offset: const Offset(0, 2))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    profileController.serviceList[index].serviceName.name,
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 8.h,),
                                  Text(
                                   profileController.serviceList[index].serviceDescription,
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            const Color(0xFF848484).withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _serviceController.deleteService(profileController.serviceList[index].id);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: themeColorGreen,
                                size: 25.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addService(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: themeColorGreen),
        onPressed: () {
          Get.toNamed(Routes.serviceAddPage);
         
        },
        child: Text(
          "Add Service",
          style:
              GoogleFonts.roboto(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ));
  }
}
