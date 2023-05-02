import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homelyknock/widgets/custom_loader.dart';

import 'help_screen_controller.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({super.key});

  final controller = Get.put(HelpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarWidget(context),
        body: Obx(
          () => controller.isLoading.value ? CustomLoader() : _bodyWidget(),
        ));
  }

  _appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Help',
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
    );
  }

  _bodyWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //  _searchWidget(),
            _popularItemListWidget(),
            _testFormFieldWidget(),
            _sendButton(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  _testFormFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Text(
          'Still need help?',
          style: GoogleFonts.roboto(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Drop us an email and we’ll get you back up and running.',
          style: GoogleFonts.roboto(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF424242)),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Email*',
          style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF555957)),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: controller.emailController,
          decoration: InputDecoration(
            hintText: 'Email',
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
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Message',
          style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF555957)),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: controller.messageController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Message',
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
        SizedBox(
          height: 50.h,
        ),
      ],
    );
  }

  _searchWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQs',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF187949)),
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: controller.searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.white,
              suffixIcon: Container(
                height: 50.h,
                width: 52.w,
                decoration: BoxDecoration(
                    color: const Color(0xFF187949),
                    borderRadius: BorderRadius.circular(4.r)),
                child: const Center(
                  child: Icon(
                    Icons.search,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
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
        )
      ],
    );
  }

  _popularItemListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        ListView.separated(
          itemCount: controller.helpData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var result = controller.helpData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(result.title,
                    style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF272727))),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.helpData[index].helps.length,
                    itemBuilder: (context, idx) {
                      var data = controller.helpData[index].helps[idx];
                      return Column(
                        children: [
                          Theme(
                            data: ThemeData()
                                .copyWith(dividerColor: Colors.transparent),
                            child: ListTileTheme(
                              contentPadding: EdgeInsets.zero,
                              minVerticalPadding: 0,
                              dense: true,
                              child: ExpansionTile(
                                tilePadding: EdgeInsets.zero,
                                title: Text(
                                  data.question,
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                ),
                                children: [
                                  HtmlWidget(
                                    data.answer,
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF424242)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: const Color(0xFF848484).withOpacity(0.08),
                          )
                        ],
                      );
                    })
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            height: 12.h,
          ),
        )
      ],
    );
  }

  _sendButton() {
    return InkWell(
      onTap: controller.sendButtonClicked,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xFF187949),
            borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            'Send',
            style: GoogleFonts.roboto(
                color: const Color(0xFFFFFFFF),
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
