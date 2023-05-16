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
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: backIconClr,
            )),
        title: Row(
          children: [
            Stack(children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage('images/img2.png'),
              ),
              Positioned(
                  top: 38.w,
                  right: 1.w,
                  child: Container(
                    height: 18.h,
                    width: 18.w,
                    decoration: const BoxDecoration(
                        color: Color(0xFF008A00), shape: BoxShape.circle),
                  ))
            ]),
            SizedBox(
              width: 15.w,
            ),
            Text(
              'Jasim Uddin',
              style: myStyle(20.sp, FontWeight.w500, const Color(0xFF272727)),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Color(0xFF353535),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width - 55.w,
                  child: Card(
                      margin:
                          EdgeInsets.only(left: 2.w, right: 2.w, bottom: 12.w),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                            hintText: 'Write message....',
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF777A79)),
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.2),
                                    width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.2),
                                    width: 2)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.2),
                                    width: 2)),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (_) => _bottomSheet());
                                    },
                                    icon: const Icon(
                                      Icons.attach_file,
                                      color: Color(0xFF353535),
                                    )),
                              ],
                            )),
                      ))),
            )
          ],
        ),
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
