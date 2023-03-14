import 'package:flutter/material.dart';
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
          style: myStyle(20, FontWeight.bold, Colors.black),
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
        padding: const EdgeInsets.all(15),
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
                      height: 50,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    color: Color(0xff187949),
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style: myStyle(16, FontWeight.normal, Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
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
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffFAFAFA)),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '431 Pending Responces',
                          style: myStyle(18, FontWeight.w500, Colors.black),
                        ),
                        Text(
                          'Updated just now',
                          style: myStyle(14, FontWeight.w400, Colors.black),
                        )
                      ],
                    ),
                    Spacer(),
                    const Icon(
                      Icons.refresh,
                      color: Colors.green,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Refresh',
                      style: myStyle(14, FontWeight.w500, Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                                      radius: 20,
                                      backgroundImage:
                                          AssetImage(pending[index]['imgUrl']),
                                    ),
                                    const SizedBox(
                                      width: 8,
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
                                                    14,
                                                    FontWeight.bold,
                                                    Colors.black),
                                              ),
                                              const Icon(
                                                Icons.restaurant,
                                                color: Colors.green,
                                                size: 15,
                                              ),
                                              Text(
                                                pending[index]['title'],
                                                style: myStyle(
                                                    12,
                                                    FontWeight.w400,
                                                    Colors.black),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffF2F2F2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.circle,
                                                      color: Colors.pink,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    Text(
                                                      'Pending',
                                                      style: myStyle(
                                                          12,
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
                                              const Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.green,
                                                size: 16,
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                pending[index]['location'],
                                                style: myStyle(
                                                    12,
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
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  pending[index]['details'],
                                  style: myStyle(
                                      12, FontWeight.w400, Colors.black),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: Color(0xffF3F3F6)),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.beenhere_outlined,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'You send Kumar an email',
                                        style: myStyle(
                                            14, FontWeight.w400, Colors.black),
                                      ),
                                      Spacer(),
                                      Text('15h ago',
                                          style: myStyle(14, FontWeight.w400,
                                              Colors.black))
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
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
