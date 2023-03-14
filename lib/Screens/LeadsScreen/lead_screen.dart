import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/LeadsDetailsScreen/leads_details_screen.dart';

import '../../nav_bar_page/nav_bar_controller.dart';

class LeadsScreen extends StatefulWidget {
  static const String routename = '/leadscreen';
  LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  List<Map> item = [
    {
      'image': 'images/kumar.png',
      'title': 'Kumar',
      'time': '3m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/rahman.png',
      'title': 'Reduan',
      'time': '5m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/haq.png',
      'title': 'Jhon Smith',
      'time': '7m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/rahman.png',
      'title': 'Rahman',
      'time': '7m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
    {
      'image': 'images/haq.png',
      'title': 'Tasmia Haq',
      'time': '9m ago',
      'locationImage': 'images/location.png',
      'address': '4517 Washington Ave, Kentucky',
      'bImage': 'images/b.png',
      'credit': '2 Credits'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Leads',
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF272727)),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF187949),
            )),
        actions: [Image.asset('images/notification.png')],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)),
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
            height: 30,
          ),
          Container(
            height: 70,
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(7)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '431 matching leads',
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset('images/service.png'),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '61 Services',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF454545)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: const Color(0xFF187949),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('images/location.png'),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          '61 Services',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF454545)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 77,
                  height: 34,
                  decoration: BoxDecoration(
                      color: const Color(0xFF187949),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/edit.png',
                        color: const Color(0xFFFFFFFF),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Edit',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFF2F2F2)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Showing all 431 leads',
            style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF686868)),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LeadsDetailsScreen(
                                image: item[index]['image'],
                                name: item[index]['title'],
                                time: item[index]['time'],
                                locationImage: item[index]['locationImage'],
                                address: item[index]['address'],
                                bImage: item[index]['bImage'],
                                credit: item[index]['credit'],
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(item[index]['image']),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item[index]['title'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF272727)),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Image.asset('images/run.png'),
                                Text(
                                  'Plumbing',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF424242)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(item[index]['locationImage']),
                                Text(
                                  item[index]['address'],
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: 27,
                          width: 77,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE8FAF1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_filled_rounded,
                                color: Color(0xFF187949),
                              ),
                              Text(
                                item[index]['time'],
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Additional Details:',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF187949)),
                          children: [
                            TextSpan(
                                text:
                                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                                style: GoogleFonts.roboto(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF848484)))
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(item[index]['bImage']),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          item[index]['credit'],
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF272727)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      color: Color(0xFF424242),
                    )
                  ],
                ),
              );
            },
            itemCount: item.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 25,
              );
            },
          )
        ],
      ),
    );
  }
}
