import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final List<Map<String, dynamic>> item = [
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    },
    {
      'image': 'images/servImage.png',
      'title': 'Commercial cleaning by expertise',
      'subTitle': '200+ Company work'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        title: Text(
          'Wishlist',
          style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF272727)),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: CircleAvatar(
              radius: 15.r,
              backgroundImage: AssetImage('images/kumar.png'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sub Category',
                style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF272727)),
              ),
              SizedBox(
                height: 30.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 86.h,
                    width: double.infinity,
                    color: Color(0xFFFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: Color(0xFFE8F2ED),
                            child: Image.asset('images/housecleaner.png'),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'House Cleaning',
                                style: GoogleFonts.roboto(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF272727)),
                              ),
                              Text(
                                '100+ Company Work',
                                style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF272727)),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Color(0xFF174E31),
                              )),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF187949)),
                              child: Text('Services'))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Services',
                style: GoogleFonts.roboto(
                    color: const Color(0xFF272727),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    mainAxisExtent: 260.h,
                  ),
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.asset(
                                    item[index]['image'],
                                    height: 108.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    right: 15.w,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Color(0xFF174E31),
                                        )))
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              item[index]['title'],
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF272727)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              item[index]['subTitle'],
                              style: GoogleFonts.roboto(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF848484)),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              height: 40.h,
                              width: 84.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF187949),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Center(
                                child: Text(
                                  'Post a Job',
                                  style: GoogleFonts.roboto(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 25.h,
              ),
              Text('Company',
                  style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727))),
              SizedBox(
                height: 25.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 230.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('images/clean.png'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mr. CLEAN',
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF272727)),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Color(0xFFEACA23),
                                    ),
                                    Text(
                                      '4.9 (200)',
                                      style: GoogleFonts.roboto(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF424242)),
                                    )
                                  ],
                                ),
                                Text(
                                  'Total 500 work complete',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Color(0xFF174E31),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'There are many variations of passages of Lorem Ipsum available.',
                          style: GoogleFonts.roboto(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF424242)),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40.h,
                              width: 84.w,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF187949),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Center(
                                child: Text(
                                  'Contact',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFFFFFFF)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 40.h,
                              width: 171.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF187949)),
                                  borderRadius: BorderRadius.circular(3.r)),
                              child: Center(
                                child: Text(
                                  'View Conpany Profile',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
