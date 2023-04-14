import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';

import 'controller/on_click_response_controller.dart';

class OneClickResponcePage extends StatelessWidget {

  OneClickResponcePage({Key? key}) : super(key: key);

  final _onClickResponseController = Get.put(OnClickResponseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Text(
          'One Click Responce',
          style: myStyle(20.sp, FontWeight.w500, Colors.black),
        ),
        actions: [
          Image.asset('images/notification.png'),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            Row(
              children: [
                Obx(()=>
                   FlutterSwitch(
                    activeColor: themeColorGreen,
                    width: 52.0.w,
                    height: 27.0.h,
                    toggleSize: 21.0.sp,
                    value: _onClickResponseController.status.value,
                    borderRadius: 30.0.r,
                    padding: 4.0.w,
                    showOnOff: false,
                    onToggle: (val) {
                   _onClickResponseController.status.value = val;
                    },
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  'One Click Responce enabled',
                  style: myStyle(18.sp, FontWeight.w500, textClr),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Email template to be used for your one-click response:',
              style: myStyle(14.sp, FontWeight.w400, textClr),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(border: Border.all(color: textClr.withOpacity(0.3), width: 0.5)),
              child: Obx(()=>
                 DropdownButtonHideUnderline(
                   child: DropdownButton(
                     style: myStyle(18.sp, FontWeight.w500, offWhite),
                     focusColor: themeColorGreen,
                     dropdownColor: scaffoldClr,
                  
                     hint: Text(_onClickResponseController.selectedValue.value),
                     items:_onClickResponseController. items
                         .map((item) => DropdownMenuItem(
                               value: item,
                               child: Text(
                                 item,
                               ),
                             ))
                         .toList(),
                     onChanged: (value) {
                     
                         _onClickResponseController.selectedValue.value = '$value';
                     
                     },
                   ),
                 ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
               const Icon(Icons.error),
                
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                    child: Text(
                  'You can view, edit and manage your email templates in email templates',
                  style: myStyle(10.sp, FontWeight.w400, textClr),
                ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(15.w),
              decoration:
                  BoxDecoration(border: Border.all(color: textClr.withOpacity(0.3), width: 0.5)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your one-click response will look like a personal email from you. Any replies to the email will be sent straight to you, meaning you ll hear back from more customers.',
                          textAlign: TextAlign.center,
                          style: myStyle(12.sp, FontWeight.w400, textClr),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.settings,
                                color: themeColorGreenbright,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Customise your templates for your one-click response',
                                textAlign: TextAlign.center,
                                style: myStyle(12.sp, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.autorenew_sharp,
                                color: themeColorGreenbright,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Respond to leads by using the one-click response button',
                                textAlign: TextAlign.center,
                                style: myStyle(12.sp, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.timer,
                                color: themeColorGreenbright,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Customers will receive your response instantly',
                                textAlign: TextAlign.center,
                                style: myStyle(12.sp, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.message,
                                color: themeColorGreenbright,
                                size: 18.sp,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Follow up with a more personalised message and quote later',
                                textAlign: TextAlign.center,
                                style: myStyle(12.sp, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'You can change your one-click response for future leads above',
                    style: myStyle(12.sp, FontWeight.w400, textClr),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
