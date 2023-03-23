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
                  height: 28,
                  width: 104,
                  color: Color(0xff187949),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            alignment: Alignment.center,
                            height: 24,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Color(0xff187949),
                                borderRadius: BorderRadius.circular(3.r)),
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
                              icon: Icon(
                                Icons.delete_sweep,
                                color: offWhite,
                                size: 18.sp,
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
                  size: 14.sp,
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
