import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/Screens/LeadsDetailsScreen/component/custom_maps.dart';
import 'package:myapp/Screens/ResistrationScreen/registrationpage.dart';

class LeadsDetailsScreen extends StatefulWidget {
  LeadsDetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.time,
      required this.locationImage,
      required this.address,
      required this.bImage,
      required this.credit});

  String image;
  String name;
  String time;
  String locationImage;
  String address;
  String bImage;
  String credit;

  @override
  State<LeadsDetailsScreen> createState() => _LeadsDetailsScreenState();
}

class _LeadsDetailsScreenState extends State<LeadsDetailsScreen> {
  List<Map> item = [
    {
      'title': 'What type of property needs cleaning?',
      'subTitle': 'House',
    },
    {
      'title': 'How often do you need cleaning services?',
      'subTitle': 'Every other week',
    },
    {
      'title': 'How many bedroom(s) need cleaning?',
      'subTitle': '3 bedrooms',
    },
    {
      'title': 'How many bathroom(s) need cleaning?',
      'subTitle': '3 bathrooms',
    },
    {
      'title': 'How many reception room(s) need cleaning?',
      'subTitle': '1',
    },
    {
      'title': 'How many staircases need cleaning?',
      'subTitle': 'None',
    },
    {
      'title': 'Which additional service(s) would you like?',
      'subTitle': 'I have pets, No extra requirements',
    },
    {
      'title': 'How many staircases need cleaning?',
      'subTitle': 'None',
    },
    {
      'title': 'When are the best days for cleaning?',
      'subTitle': 'Friday',
    },
    {
      'title': 'Are you ready to hire someone?',
      'subTitle': 'Yes, I need this service ASAP',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF187949),
                        )),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage(widget.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF272727)),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    Image.asset('images/notification.png')
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(3)),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        title: Text(
                          'House Cleaning Service',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF272727)),
                        ),
                        trailing: Container(
                          height: 27,
                          width: 76,
                          decoration: BoxDecoration(
                              color: const Color(0xFFE8FAF1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.access_time_filled),
                              Text(
                                widget.time,
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF187949)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(widget.locationImage),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(widget.address)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: Color(0xFF187949),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      '+122******6***',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF272727)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 12,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE8FAF1),
                          borderRadius: BorderRadius.circular(3)),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/righttick.png',
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            'verified',
                            style: GoogleFonts.roboto(
                                fontSize: 8,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF187949)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Color(0xFF187949),
                    ),
                    Text(
                      'your******@email.com',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF272727)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFF187949),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFF187949),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFF187949),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFFF2F2F2),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFFF2F2F2),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '3/5 professionals have responded',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF000000)),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        height: 18,
                        width: 14,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF292D32))),
                        child: const Center(
                          child: Text('!'),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 148,
                      decoration: BoxDecoration(
                          color: const Color(0xFF187949),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Contact',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 148,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF187949)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Not interested',
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF187949)),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Image.asset(
                      widget.bImage,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.credit,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF848484)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Details',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272727)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: const Color(0xFF848484).withOpacity(0.05),
                  height: 1,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item[index]['title'],
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF424242)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          item[index]['subTitle'],
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF424242)),
                        ),
                      ],
                    );
                  },
                  itemCount: item.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(height: 200, child: CustomMaps()),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    color: const Color(0xFF848484).withOpacity(0.05),
                    height: 5,
                    thickness: 3,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Not seeing the right leads?',
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF272727)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Stop seeing leads with specific answers by customising your settings.',
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF424242)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset('images/settings2.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Update lead settings',
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF187949)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customeText({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF424242)),
    );
  }
}
