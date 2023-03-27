import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

import '../SettingsScreen/setting_page.dart';

class ReviewsPage extends StatefulWidget {
  static const String routename = '/reviews';
  ReviewsPage({Key? key}) : super(key: key);

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  List<Map> reviews = [
    {
      'imgUrl': 'images/haq.png',
      'name': 'Jasim Uddin',
      'date': '15 Jan 2023',
      'ratings': '5.0',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/jhon.png',
      'name': 'Jhon Smith',
      'date': '12 Jan 2023',
      'ratings': '4.9',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/kumar.png',
      'name': 'Barak Uddin',
      'date': '10 Jan 2023',
      'ratings': '4.8',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/redun.png',
      'name': 'Mr. Karun',
      'date': '15 Jan 2023',
      'ratings': '4.7',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/rahman.png',
      'name': 'Josef Benjamin',
      'date': '15 Jan 2023',
      'ratings': '5.0',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/haq.png',
      'name': 'Henry Feyol',
      'date': '15 Jan 2023',
      'ratings': '4.0',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Reviews',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffC3F6D7),
                ),
                child: Text(
                  '4.9',
                  style: myStyle(20.sp, FontWeight.w700, Colors.black),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffEACA23),
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffEACA23),
                    size: 20.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 15.sp,
              ),
              Row(
                children: [
                  Text(
                    'Overall Rating',
                    style: myStyle(20.sp, FontWeight.w500, textClr),
                  ),
                  Spacer(),
                  Text(
                    '4.9',
                    style: myStyle(20.sp, FontWeight.w500, textClr),
                  ),
                  SizedBox(width: 3.w,),
                  Text(
                    '(500)',
                    style: myStyle(14.sp, FontWeight.w300, Color(0xff848484)),
                  ),
                  Spacer(),
                  Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.r),
                        color: Color(0xff187949)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Filter',
                          style: myStyle(16.sp, FontWeight.w400, scaffoldClr),
                        ),
                        SizedBox(
                          width: 5.r,
                        ),
                        Icon(
                          Icons.filter_list_sharp,
                          color: scaffoldClr,
                          size: 18.sp,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Flexible(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                color: Color(0xffF8F8F8),
                                borderRadius: BorderRadius.circular(3.r)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 22.r,
                                  backgroundImage:
                                      AssetImage(reviews[index]['imgUrl']),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            reviews[index]['name'],
                                            style: myStyle(18.sp,
                                                FontWeight.w500, textClr),
                                          ),
                                          Spacer(),
                                          Text(
                                            reviews[index]['date'],
                                            style: myStyle(14.sp,
                                                FontWeight.w400, Colors.black),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffEACA23),
                                            size: 20.sp,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffEACA23),
                                            size: 20.sp,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffEACA23),
                                            size: 20.sp,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffEACA23),
                                            size: 20.sp,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffEACA23),
                                            size: 20.sp,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(reviews[index]['ratings'])
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            reviews[index]['details'],
                                            maxLines: 6,
                                            overflow: TextOverflow.ellipsis,
                                            style: myStyle(14.sp,
                                                FontWeight.w400, Color(0xff848484)),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: reviews.length)),
              SizedBox(height: 20.h,),
              Container(
                alignment: Alignment.center,
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xff187949)
                ),
                child: Text('See All Review', style: myStyle(16.sp, FontWeight.w500, Color(0xffF2F2F2)),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
