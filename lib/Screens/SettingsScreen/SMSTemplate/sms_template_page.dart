import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class SMSTemplatePage extends StatefulWidget {
  SMSTemplatePage({Key? key}) : super(key: key);

  @override
  State<SMSTemplatePage> createState() => _SMSTemplatePageState();
}

class _SMSTemplatePageState extends State<SMSTemplatePage> {
  List<String> name = ['Visit'];

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
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'SMS Templates',
          style: myStyle(20.sp, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.w),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My templates',
                  style: myStyle(20.sp, FontWeight.w500, textClr),
                ),
                Container(
                  color: themeColorGreen,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 12.sp,
                        color: scaffoldClr,
                      ),
                      Text(
                        'Add template',
                        style: myStyle(12.sp, FontWeight.w400, scaffoldClr),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: scaffoldClr,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text(
                            name[index],
                            style: myStyle(18.sp, FontWeight.w500, textClr),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.w),
                            decoration: BoxDecoration(
                                color: themeColorGreen,
                                borderRadius: BorderRadius.circular(4.r)),
                            child: Text(
                              'Edit',
                              style:
                                  myStyle(12.sp, FontWeight.w400, scaffoldClr),
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_sweep,
                                color: offWhite,
                              ))
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: name.length),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 12.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Learn more about email templates',
                  style: myStyle(12.sp, FontWeight.w400, offWhite),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
