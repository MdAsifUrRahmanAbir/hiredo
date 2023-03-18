import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      'imgUrl': 'images/img1.png',
      'name': 'Jasim Uddin',
      'date': '15 Jan 2023',
      'ratings': '5.0',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/img2.png',
      'name': 'Jhon Smith',
      'date': '12 Jan 2023',
      'ratings': '4.9',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/img3.png',
      'name': 'Barak Uddin',
      'date': '10 Jan 2023',
      'ratings': '4.8',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/img4.png',
      'name': 'Mr. Karun',
      'date': '15 Jan 2023',
      'ratings': '4.7',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Josef Benjamin',
      'date': '15 Jan 2023',
      'ratings': '5.0',
      'details':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s'
    },
    {
      'imgUrl': 'images/img5.png',
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
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'Reviews',
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
                    style: myStyle(20.sp, FontWeight.w500, Colors.black),
                  ),
                  Spacer(),
                  Text(
                    '4.9',
                    style: myStyle(20.sp, FontWeight.w500, Colors.black),
                  ),
                  Text(
                    '(500)',
                    style: myStyle(14.sp, FontWeight.w300, Colors.grey),
                  ),
                  Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: Colors.green),
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style: myStyle(16.sp, FontWeight.w400, Colors.white),
                        ),
                        SizedBox(
                          width: 5.r,
                        ),
                        Icon(
                          Icons.filter_list_sharp,
                          color: Colors.white,
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
                                borderRadius: BorderRadius.circular(5.r)),
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
                                                FontWeight.w500, Colors.black),
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
                                        height: 8.h,
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
                                                FontWeight.w400, Colors.grey),
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
                      itemCount: reviews.length))
            ],
          ),
        ),
      ),
    );
  }
}
