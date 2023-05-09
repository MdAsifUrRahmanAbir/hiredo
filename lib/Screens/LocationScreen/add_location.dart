import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/LocationScreen/Model/add_location_model.dart';

import '../../GoogleMapService/Model/prediction_model.dart';

import '../JobPost/Model/location_model.dart';

import 'location_controller.dart';

class AddLoaction extends StatelessWidget {
  AddLoaction({super.key});

  final _locationController = Get.put(LocationController());
  var isEdit = Get.arguments['isEdit'];
  var data = Get.arguments['data'];
  AddLocationModel? locationData;

  @override
  Widget build(BuildContext context) {
    _locationController.searchTextController.clear();
    _locationController.distanceController.clear();
    if (data != null) {
      locationData = data;

      _locationController.searchTextController.text = locationData!.city;
      _locationController.distanceController.text = locationData!.distance;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          isEdit ? "Update Location" : "Add Location",
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff272727)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _locationController.searchTextController,
                  autofocus: false,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                  decoration: InputDecoration(
                      hintText: "e.g. London",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.r),
                        borderSide: const BorderSide(
                          color: Color(0xFF848484),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.r),
                        borderSide: const BorderSide(
                          color: Color(0xFF848484),
                          width: 1,
                        ),
                      ))),
              onSuggestionSelected: (Prediction suggestion) async {
                _locationController.searchTextController.text =
                    suggestion.description;
                List<Location> locations =
                    await locationFromAddress(suggestion.description);

                _locationController.locationData = LocationDataModel(
                    location: suggestion.description,
                    latitude: locations.last.latitude.toString(),
                    longitude: locations.last.longitude.toString());
              },
              suggestionsCallback: (pattern) async {
                return await _locationController.searchLocation(
                    context, pattern);
              },
              itemBuilder: (context, Prediction suggestion) {
                return ListTile(
                  leading: const Icon(Icons.location_pin),
                  title: Text(suggestion.description),
                );
              },
            ),

            SizedBox(
              height: 10.h,
            ),

            TextFormField(
              controller: _locationController.distanceController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field is Empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Distance',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.5)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0)),
              ),
            ),

            SizedBox(
              height: 10.h,
            ),

            // DropdownSearch<ServiceModel>.multiSelection(
            //   key: _popupCustomValidationKey,
            //   dropdownDecoratorProps: const DropDownDecoratorProps(),
            //   items: profileController.serviceList,
            //   onChanged: (value) {
            //     value.forEach((element) {
            //       _locationController.selectServiceList.clear();
            //       _locationController.selectServiceList.add(element.id);
            //       print(_locationController.selectServiceList);
            //     });
            //   },
            //   itemAsString: (item) => item.serviceName.name,
            //   popupProps:
            //       const PopupPropsMultiSelection.menu(showSearchBox: true),
            // ),

            SizedBox(
              height: 70.h,
            ),
            InkWell(
              onTap: () {
                if (isEdit) {
                  _locationController.updateServiceLocation(locationData!.id);
                } else {
                  _locationController.addLocationService();
                }
              },
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xFF187949),
                    borderRadius: BorderRadius.circular(8.w)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isEdit ? "Update" : "Submit",
                      style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(
                      () => SizedBox(
                        width: _locationController.isLoading.value ? 15.w : 0,
                      ),
                    ),
                    Obx(() {
                      if (_locationController.isLoading.value) {
                        return SizedBox(
                          height: 15.sp,
                          width: 15.sp,
                          child: const CircularProgressIndicator(
                            strokeWidth: 3,
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
          ],
        ),
      ),
    );
  }
}
