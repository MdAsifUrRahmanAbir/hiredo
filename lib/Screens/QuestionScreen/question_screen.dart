import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/ResistrationScreen/component/custom_button.dart';

import 'Controller/question_controller.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF187949),
          ),
        ),
        title: Text(
          'Order',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 18.w, top: 16.h, right: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What type of property needs cleaning?',
              style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint",
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _questionController.item.length,
                itemBuilder: (BuildContext context, int index) {
                  var result = _questionController.item[index];
                  return Container(
                      height: 55.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 7,
                                spreadRadius: 5,
                                offset: const Offset(0, 2))
                          ]),
                      child: Obx(
                        () => ListTile(
                          onTap: () {
                            _questionController.selectedItemIndex.value = index;
                          },
                          dense: true,
                          title: Text(
                            result['title'],
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF272727)),
                          ),
                          trailing: Radio(
                            activeColor: const Color(0xFF187949),
                            groupValue:
                                _questionController.selectedItemIndex.value,
                            value: index,
                            onChanged: (value) {
                              _questionController.selectedItemIndex.value =
                                  value!;
                            },
                          ),
                        ),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                      height: 10.h,
                    )),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(title: 'Next', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
