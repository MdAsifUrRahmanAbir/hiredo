import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/ProfileScreen/Controller/profile_controller.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../HomeScreen/Controller/home_controller.dart';
import '../HomeScreen/Model/lead_category_model.dart';

import '../LocationScreen/Model/add_location_model.dart';
import 'Controller/service_controller.dart';

class ServiceAdd extends StatelessWidget {
  ServiceAdd({super.key});

  final _serviceController = Get.put(ServiceController());
  final _homeController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    _serviceController.isServieselect.value = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add Service',
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
      body: Obx(
        () => _serviceController.isLoading.value
            ? const CustomLoader()
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Add Service",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(
                          () => DropdownSearch<LeadCategoriesModel>(
                            items: _homeController.subCategoryList,
                            dropdownButtonProps: const DropdownButtonProps(
                              icon: SizedBox(),
                            ),
                            popupProps:
                                const PopupProps.menu(showSearchBox: true),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  labelText: "What service do you need?",
                                  hintText:
                                      "e.g. Personal Trainers,House Cleaning ",
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3.r),
                                      borderSide: BorderSide(
                                          color: _serviceController
                                                  .isServieselect.value
                                              ? Colors.red
                                              : const Color(0xFF848484))),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(3.r))),
                            ),
                            itemAsString: (LeadCategoriesModel u) => u.name,
                            onChanged: (value) {
                              _serviceController.selectedServiceId = value!.id;

                              debugPrint(value.catName.length.toString());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DropdownSearch<AddLocationModel>.multiSelection(
                          dropdownDecoratorProps:
                              const DropDownDecoratorProps(),
                          items: _profileController.locationList,
                          onChanged: (value) {
                            for (var element in value) {
                              _serviceController.locationList.clear();
                              _serviceController.locationList.add(element.id);
                            }
                          },
                          itemAsString: (item) => item.city,
                          popupProps: const PopupPropsMultiSelection.menu(
                              showSearchBox: true),
                        ),

                        // Obx(
                        //   () => DropdownSearch<AddLocationModel>(
                        //     items: _profileController.locationList,
                        //     dropdownButtonProps: const DropdownButtonProps(
                        //       icon: SizedBox(),
                        //     ),
                        //     popupProps:
                        //         const PopupProps.menu(showSearchBox: true),
                        //     dropdownDecoratorProps: DropDownDecoratorProps(
                        //       dropdownSearchDecoration: InputDecoration(
                        //           labelText: "What service do you need?",
                        //           hintText:
                        //               "e.g. Personal Trainers,House Cleaning ",
                        //           isDense: true,
                        //           contentPadding: EdgeInsets.symmetric(
                        //             horizontal: 16.w,
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //               borderRadius: BorderRadius.circular(3.r),
                        //               borderSide: BorderSide(
                        //                   color: _serviceController
                        //                           .isServieselect.value
                        //                       ? Colors.red
                        //                       : const Color(0xFF848484))),
                        //           border: OutlineInputBorder(
                        //               borderRadius:
                        //                   BorderRadius.circular(3.r))),
                        //     ),
                        //     itemAsString: (AddLocationModel u) => u.city,
                        //     onChanged: (value) {
                        //       _serviceController.locationId.value = value!.id;
                        //     },
                        //   ),
                        // ),

                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          controller: _serviceController.descriptionController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field is Empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Service Description',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.5)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: 0.5)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0)),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (_serviceController.selectedServiceId != 0 &&
                                _formKey.currentState!.validate()) {
                              _serviceController.submitedService();
                            } else if (_serviceController.selectedServiceId ==
                                0) {
                              _serviceController.isServieselect.value = true;
                            }
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
                              ],
                            ),
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
      ),
    );
  }
}
