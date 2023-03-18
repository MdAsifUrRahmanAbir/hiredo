import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';

class MyResponse extends StatefulWidget {
  MyResponse({Key? key}) : super(key: key);

  @override
  State<MyResponse> createState() => _MyResponseState();
}

class _MyResponseState extends State<MyResponse> {
  List<Map> pending = [
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    },
    {
      'imgUrl': 'images/img.png',
      'name': 'Kumar',
      'title': 'Kitchen Refurbishment',
      'location': '4517 Washington Ave, Kentucky',
      'details':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit ...'
    }
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
              color: Color(0xff187949),
            )),
        title: Text(
          'My Responce',
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          fillColor: Colors.white,
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
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 50.h,
                    color: const Color(0xff187949),
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style:
                              myStyle(16.sp, FontWeight.normal, Colors.white),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.filter_list_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                height: 70.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: const Color(0xffFAFAFA)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '431 Pending Responces',
                          style: myStyle(18.sp, FontWeight.w500, Colors.black),
                        ),
                        Text(
                          'Updated just now',
                          style: myStyle(14.sp, FontWeight.w400, Colors.black),
                        )
                      ],
                    ),
                    Spacer(),
                    const Icon(
                      Icons.refresh,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Refresh',
                      style: myStyle(14.sp, FontWeight.w500, Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage:
                                          AssetImage(pending[index]['imgUrl']),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                pending[index]['name'],
                                                style: myStyle(
                                                    14.sp,
                                                    FontWeight.bold,
                                                    Colors.black),
                                              ),
                                              Icon(
                                                Icons.restaurant,
                                                color: Colors.green,
                                                size: 15.sp,
                                              ),
                                              Text(
                                                pending[index]['title'],
                                                style: myStyle(
                                                    12.sp,
                                                    FontWeight.w400,
                                                    Colors.black),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w,
                                                    vertical: 5.w),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffF2F2F2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Colors.pink,
                                                      size: 18.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 6.w,
                                                    ),
                                                    Text(
                                                      'Pending',
                                                      style: myStyle(
                                                          12.sp,
                                                          FontWeight.w400,
                                                          Colors.black),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.green,
                                                size: 16.sp,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Text(
                                                pending[index]['location'],
                                                style: myStyle(
                                                    12.sp,
                                                    FontWeight.w400,
                                                    Colors.grey),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Text(
                                  pending[index]['details'],
                                  style: myStyle(
                                      12.sp, FontWeight.w400, Colors.black),
                                ),
                                SizedBox(
                                  height: 15.sp,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color: Color(0xffF3F3F6)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.beenhere_outlined,
                                        size: 16.sp,
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        'You send Kumar an email',
                                        style: myStyle(14.sp, FontWeight.w400,
                                            Colors.black),
                                      ),
                                      Spacer(),
                                      Text('15h ago',
                                          style: myStyle(14.sp, FontWeight.w400,
                                              Colors.black))
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: pending.length)),
            ],
          ),
        ),
      ),
    );
  }
}
