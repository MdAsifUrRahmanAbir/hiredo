import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/EmailNotification/Controller/email_controller.dart';

class EmailNotification extends StatelessWidget {
  EmailNotification({super.key});

  final _emailController = Get.put(EmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Email notifications',
                style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF272727)),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 70.h,
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFF9F9FA)),
                child: Row(
                  children: [
                    Image.asset('images/mark.png'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Control what youd like us to email you about. Not getting our e-mails? ',
                          style: GoogleFonts.roboto(fontSize: 16.sp),
                          children: const [
                            TextSpan(
                                text: 'Click Here',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                            // can add more TextSpans here...
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Email me about:',
                style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF6E6874)),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 57.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.1))),
                    child: Obx(
                      () => ListTile(
                          title: Text(
                            _emailController.items[index].title,
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF272727)),
                          ),
                          trailing: Switch(
                              onChanged: (value) {
                                _emailController.isSwitched[index] = value;
                              },
                              value: _emailController.isSwitched[index],
                              activeColor: Colors.white,
                              activeTrackColor: const Color(0xFF47BF9C),
                              inactiveThumbColor: Colors.pink,
                              inactiveTrackColor: Colors.green)),
                    ),
                  );
                },
                itemCount: _emailController.items.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                  ),
                  Text(
                    'Cancel',
                    style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF272727)),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 45.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFF187949),
                        borderRadius: BorderRadius.circular(4.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/tick_mark.png'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Save',
                          style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
