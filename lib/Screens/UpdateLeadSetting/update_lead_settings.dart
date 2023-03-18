import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateLeadSettings extends StatelessWidget {
  static const String routename = '/updateleadsettings';
  const UpdateLeadSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Lead settings',
            style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF272727)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF187949),
              )),
          centerTitle: true,
          actions: [Image.asset('images/notification.png')],
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
          children: [
            Text(
              'Leads you can choose to contact.',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF187949)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              'Your services',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Fine tune the leads you want to be alerted about.',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 25.h,
            ),
            itemListTile(
                title: 'Wedding Photography',
                subTitle: 'All leads',
                location: '1 location'),
            SizedBox(
              height: 30.h,
            ),
            itemListTile(
                title: 'Web Design',
                subTitle: 'All leads',
                location: '1 location'),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 57.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF187949))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF187949),
                      )),
                  Text(
                    'Add a Service',
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF187949)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Your locations',
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272727)),
            ),
            Text(
              'Choose where you want to find new customers.',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Image.asset('images/location.png'),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('4517 Washington',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF272727))),
                    Text('20 miles of K0A 0A1',
                        style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF424242))),
                  ],
                ),
                SizedBox(
                  width: 150.w,
                ),
                Image.asset('images/edit.png'),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 57.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF187949))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF187949),
                      )),
                  Text(
                    'Add a New Location',
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF187949)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Online/remote leads',
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "Customers tell us if they’re happy to receive services online or remotely.",
              style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF424242)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF187949),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Center(
                child: Text(
                  'Save',
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFF2F2F2)),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }

  Widget itemListTile(
      {required String title,
      required String subTitle,
      required String location}) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.roboto(
            fontSize: 14.sp,
            color: const Color(0xFF272727),
            fontWeight: FontWeight.w400),
      ),
      subtitle: Row(
        children: [
          Text(
            subTitle,
            style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            height: 4.h,
            width: 4.w,
            color: const Color(0xFF272727),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            location,
            style: GoogleFonts.roboto(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF424242)),
          ),
        ],
      ),
      trailing: Icon(
        Icons.arrow_back_ios,
        color: Color(0xFF272727),
        size: 15.sp,
      ),
    );
  }
}
