import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/Screens/SettingsScreen/SMSTemplate/Controller/sms_template_controller.dart';
import 'package:homelyknock/Screens/SettingsScreen/setting_page.dart';
import 'package:homelyknock/utils/colors.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import '../../../widgets/data_controller.dart';



class SMSTemplatePage extends StatelessWidget {
  SMSTemplatePage({Key? key}) : super(key: key);



  final _smsTemplateController = Get.put(SmsTemplateController());
    final _dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    _smsTemplateController.getSMSTemplate(false);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: backIconClr,
              )),
          title: Text(
            'SMS Templates',
            style: myStyle(20.sp, FontWeight.w500, Colors.black),
          ),
          actions: [
            Image.asset('images/notification.png'),
          ],
        ),
        body:Obx(()=> _smsTemplateController.isLoading.value? const CustomLoader(): Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My template',
                    style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF272727)),
                  ),
                  InkWell(
                    onTap: () {
                      
                      _add_bottom_sheet(context);

                    },
                    child: Container(
                      height: 28.h,
                      width: 104.w,
                      decoration: BoxDecoration(
                          color: Color(0xFF187949),
                          borderRadius: BorderRadius.circular(3.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Color(0xFFFFFFFF),
                            size: 18.sp,
                          ),
                          Text(
                            'Add template',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFFFFFF)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
           
           
              SizedBox(
                height: 20.h,
              ),
              
                 ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _smsTemplateController.smsTemplateModel.length,
                  itemBuilder: (context, index) {
                    var result = _smsTemplateController.smsTemplateModel[index];
                    return  Container(
                    width: double.infinity,
                    height: 52.h,
                    padding: EdgeInsets.only(left: 10.w),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            result.templateName,
                            style: GoogleFonts.roboto(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: (){

                            _smsTemplateController.upNameController.text = result.templateName;
                            _smsTemplateController.upMessageTemplateController.text = result.message;
                            _dataController.id.value = result.id;
                            

                            showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r))),
                      builder: (ctx) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Update SMS Templates',
                                style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    color: const Color(0xFF272727),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                controller: _smsTemplateController.smsNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Template Name',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0)),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                controller: _smsTemplateController.messageTemplateController,
                                decoration: const InputDecoration(
                                  hintText: 'Message',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0)),
                                ),
                              ),
                            
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                         _smsTemplateController.updateSMS(result.id);
                                
                                },
                                child: Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF187949),
                                      borderRadius:
                                          BorderRadius.circular(8.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Update',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Obx(()=>
                                         SizedBox(
                                          width: _smsTemplateController.isAddLoading.value? 5.0.w:0,
                                        ),
                                      ),
                                      Obx((){
                                        if(_smsTemplateController.isAddLoading.value){
                                          return SizedBox(
                                            height: 10.0.h,
                                            width: 10.0.w,
                                            child: const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          );
                                        }else{
                                          return const SizedBox();
                                        }
                                      })
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });

                          },
                          child: Container(
                            height: 24.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFF187949),
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Center(
                              child: Text(
                                'Edit',
                                style: GoogleFonts.roboto(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_sweep,
                              color: Color(0xFF848484),
                            ))
                      ],
                    ),
                  );
                           
                  },
                 
                           
                ),
              
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.error,
                    color: Color(0xFF848484),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Learn more about SMS templates',
                    style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF848484)),
                  )
                ],
              )
            ],
          ),
        ))
  );
  }

  Future<dynamic> _add_bottom_sheet(BuildContext context) {
    return showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      backgroundColor: const Color(0xFFFFFFFF),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r))),
                      builder: (ctx) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Create SMS Templates',
                                style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    color: const Color(0xFF272727),
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                controller: _smsTemplateController.smsNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Template Name',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0)),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                controller: _smsTemplateController.messageTemplateController,
                                decoration: const InputDecoration(
                                  hintText: 'Message',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0.5)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF000000),
                                          width: 0)),
                                ),
                              ),
                            
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                         
                                  _smsTemplateController.addSmsTemplate();
                                },
                                child: Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF187949),
                                      borderRadius:
                                          BorderRadius.circular(8.r)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Submit',
                                        style: GoogleFonts.roboto(
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Obx(()=>
                                         SizedBox(
                                          width: _smsTemplateController.isAddLoading.value? 5.0.w:0,
                                        ),
                                      ),
                                      Obx((){
                                        if(_smsTemplateController.isAddLoading.value){
                                          return SizedBox(
                                            height: 10.0.h,
                                            width: 10.0.w,
                                            child: const CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          );
                                        }else{
                                          return const SizedBox();
                                        }
                                      })
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
  }
}
