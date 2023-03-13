// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPage extends StatefulWidget {
  static const String routename = '/locationpage';
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.green)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 120,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Search ",
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Color(0xffB7B7B7)),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 50,
                      width: 120,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: "Location",
                            prefix: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Color(0xffB7B7B7)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Color(0xff187949),
                        height: 50,
                        width: 45,
                        child: Icon(
                          Icons.search,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (contex, index) => Container(
                        height: 90,
                        width: 376,
                        child: Card(
                          elevation: 1,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.location_pin,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "Within 50 miles of East York",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1 service",
                                      style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff80848484)),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(0xff187949),
                                        ),
                                        height: 26,
                                        width: 87,
                                        child: Center(
                                            child: Text("View on Map",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffFFFFFF)))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: Color(0xff187949))),
                                        height: 26,
                                        width: 70,
                                        child: Center(
                                            child: Text("Remove",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff187949)))),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 10),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    ));
  }
}
