import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../GoogleMapService/Model/prediction_model.dart';
import '../JobPost/Controller/job_post_controller.dart';
import '../JobPost/Model/location_model.dart';
import 'location_controller.dart';

class AddLoaction extends StatelessWidget {
  AddLoaction({super.key});

  final _jobPostController = Get.put(JobPostController());
  final _locationController = Get.put(LocationController());
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Location",
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
                  controller: _jobPostController.searchTextController,
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
                _jobPostController.searchTextController.text =
                    suggestion.description;
                List<Location> locations =
                    await locationFromAddress(suggestion.description);
                _jobPostController.lat.value = locations.last.latitude;
                _jobPostController.leng.value = locations.last.longitude;

                _jobPostController.locationData = LocationDataModel(
                    location: suggestion.description,
                    latitude: _jobPostController.lat.value.toString(),
                    longitude: _jobPostController.leng.value.toString());
                debugPrint(_jobPostController.lat.value.toString());
                debugPrint(_jobPostController.leng.value.toString());
              },
              suggestionsCallback: (pattern) async {
                return await _jobPostController.searchLocation(
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
            DropdownSearch<int>.multiSelection(
                key: _popupCustomValidationKey,
                items: const [1, 2, 3, 4, 5, 6, 7],
                popupProps: PopupPropsMultiSelection.dialog(
                    validationWidgetBuilder: (ctx, selectedItems) {
                  return Container(
                    color: Colors.blue[200],
                    height: 56.h,
                    child: Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        child: Text(
                          'OK',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          _popupCustomValidationKey.currentState
                              ?.popupOnValidate();
                        },
                      ),
                    ),
                  );
                })),
            SizedBox(
              height: 70.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF187949),
                  borderRadius: BorderRadius.circular(8.w)),
              child: Center(
                child: Text(
                  'Submit',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
