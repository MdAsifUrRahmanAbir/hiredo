import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../SettingsScreen/setting_page.dart';
import 'Controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leadingWidth: 45.w,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Row(
          children: [
            Stack(alignment: Alignment.bottomRight, children: [
              CircleAvatar(
                radius: 25.w,
                backgroundImage: const AssetImage('images/img2.png'),
              ),
              Positioned(
                  bottom: 5.w,
                  child: Container(
                    height: 12.w,
                    width: 12.w,
                    decoration: const BoxDecoration(
                        color: Color(0xFF008A00), shape: BoxShape.circle),
                  ))
            ]),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Text(
                'Jasim Uddin',
                style: myStyle(20.sp, FontWeight.w500, const Color(0xFF272727)),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          const Icon(
            Icons.more_vert,
            color: Color(0xFF353535),
          ),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              itemCount: _chatController.messageList.length,
              itemBuilder: (BuildContext context, int index) {
                var data = _chatController.messageList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Row(
                    mainAxisAlignment: data.isSender
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: data.isSender
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 267.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 18.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: data.isSender
                                    ? const Color(0xFF187949)
                                    : Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 0),
                                      color: const Color(0xFF000000)
                                          .withOpacity(0.06))
                                ]),
                            child: Text(
                              data.text,
                              style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: data.isSender
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF353535)),
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            data.time,
                            style: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF777A79)),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: TextFormField(
              controller: _chatController.messageEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              minLines: 1,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
              decoration: InputDecoration(
                  hintText: 'Write message....',
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF777A79)),
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color(0xFF000000).withOpacity(0.04),
                          width: 1)),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (_) => _bottomSheet());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Icon(
                              Icons.attach_file,
                              color: const Color(0xFF353535),
                              size: 25.h,
                            ),
                          )),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Icon(
                              Icons.send,
                              color: const Color(0xFF187949),
                              size: 25.h,
                            ),
                          )),
                      SizedBox(
                        width: 5.w,
                      ),
                    ],
                  )),
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }

  _bottomSheet() {
    return SizedBox(
      width: 240.w,
      height: 250.h,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        margin: EdgeInsets.only(left: 60.w, bottom: 76.w, right: 60.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: const Color(0xFF02A652),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: () {
                      _chatController.selectedImageCamera();
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Camera',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF555957)),
                )
              ],
            ),
            SizedBox(
              width: 30.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: const Color(0xFFF25A2A),
                  child: IconButton(
                    icon: const Icon(
                      Icons.insert_photo,
                      color: Color(0xFFFFFFFF),
                    ),
                    onPressed: () {
                      _chatController.selectedImageGallery();
                    },
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Gallery',
                  style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF555957)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
