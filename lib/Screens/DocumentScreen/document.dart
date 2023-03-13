// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Document extends StatefulWidget {
  static const String routename = '/documentpage';
  const Document({super.key});

  @override
  State<Document> createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: IntrinsicHeight(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  "Real Time Services",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff555957),
                      letterSpacing: 1),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          child: Stack(
                            children: [
                              Card(
                                elevation: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AspectRatio(
                                        aspectRatio: 1.7,
                                        child: Container(
                                            child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "images/img.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ))),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Commercial Cleaning",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff272727),
                                                letterSpacing: 1),
                                          ),
                                          Text(
                                            "by expertise",
                                            style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff272727),
                                                letterSpacing: 1),
                                          ),
                                          Text(
                                            "200+ Company Work",
                                            style: GoogleFonts.roboto(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff848484),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: Color(0xff187949),
                                              ),
                                              height: 26,
                                              width: 84,
                                              child: Center(
                                                  child: Text(
                                                "Book Now",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFFFFFF),
                                                    letterSpacing: 1),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 14,
                                  top: 14,
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                    color: Color(0xff187949),
                                  ))
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
