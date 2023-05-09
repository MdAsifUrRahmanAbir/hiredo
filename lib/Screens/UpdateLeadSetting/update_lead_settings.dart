import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/widgets/custom_widgets.dart';

import 'Controller/update_lead_controller.dart';

class UpdateLeadSettings extends StatelessWidget {
  UpdateLeadSettings({super.key});

  final updatLeadController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Lead settings',
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF187949),
              )),
          centerTitle: true,
          actions: [Image.asset('images/notification.png')],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
          children: [
            Text(
              'Leads you can choose to contact.',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF187949)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Your services',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Fine tune the leads you want to be alerted about.',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 25.h,
            ),
            Obx(
              () => updatLeadController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          updatLeadController.addServiceModel.results!.length,
                      itemBuilder: (context, index) {
                        var result =
                            updatLeadController.addServiceModel.results![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.serviceName.toString(),
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF272727)),
                                ),
                                Text(result.serviceDescription.toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF424242))),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.navigate_next,
                                  color: Color(0xFF272727),
                                ))
                          ],
                        );
                      }),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: updatLeadController.desginController,
                              decoration: const InputDecoration(
                                hintText: 'Add Service Name',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller:
                                  updatLeadController.descriptionController,
                              decoration: const InputDecoration(
                                hintText: 'Add Service Description',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF187949),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFFFFFFF)),
                                    ),
                                    Obx(() => SizedBox(
                                          width: updatLeadController
                                                  .isLoading.value
                                              ? 5.w
                                              : 0,
                                        )),
                                    Obx(() {
                                      if (updatLeadController.isLoading.value) {
                                        return SizedBox(
                                          height: 10.h,
                                          width: 10.w,
                                          child:
                                              const CircularProgressIndicator(
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
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                height: 57.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF187949))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xFF187949),
                    ),
                    Text(
                      'Add a Service',
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF187949)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Your locations',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Choose where you want to find new customers.',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Image.asset('images/location.png'),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Obx(
                      () => updatLeadController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: updatLeadController
                                  .locationModel.results!.length,
                              itemBuilder: (context, index) {
                                var result = updatLeadController
                                    .locationModel.results![index];
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      result.city.toString(),
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF272727)),
                                    ),
                                    Text(result.distance.toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF272727)))
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: 10.h,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                  ),
                  Image.asset('images/edit.png'),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: updatLeadController.cityController,
                              decoration: const InputDecoration(
                                hintText: 'Add City',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller:
                                  updatLeadController.distanceController,
                              decoration: const InputDecoration(
                                hintText: 'Add Location Distance',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              onTap: () {
                                updatLeadController.submiteLocation();
                              },
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF187949),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Submit',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFFFFFFFF)),
                                    ),
                                    Obx(() => SizedBox(
                                          width: updatLeadController
                                                  .isLoading.value
                                              ? 5.w
                                              : 0,
                                        )),
                                    Obx(() {
                                      if (updatLeadController.isLoading.value) {
                                        return SizedBox(
                                          height: 10.h,
                                          width: 10.w,
                                          child:
                                              const CircularProgressIndicator(
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
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                height: 57.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF187949))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Color(0xFF187949),
                        )),
                    Text(
                      'Add a New Location',
                      style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF187949)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Online/remote leads',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Customers tell us if they’re happy to receive services online or remotely.",
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF187949),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                child: Text(
                  'Save',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF2F2F2)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }

  Widget itemListTile(
      {required String title,
      required String subTitle,
      required String location}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 14.sp,
            color: const Color(0xFF272727),
            fontWeight: FontWeight.w400),
      ),
      subtitle: Row(
        children: [
          Text(
            subTitle,
            style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            height: 4.h,
            width: 4.w,
            color: const Color(0xFF272727),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            location,
            style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_back_ios,
        color: Color(0xFF272727),
        size: 15.sp,
      ),
    );
  }
}
