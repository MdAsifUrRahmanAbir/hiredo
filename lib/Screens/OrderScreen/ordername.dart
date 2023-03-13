// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderName extends StatefulWidget {
  const OrderName({super.key});

  @override
  State<OrderName> createState() => _OrderNameState();
}

class _OrderNameState extends State<OrderName> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Color(0xff187949),
            )),
        title: Text(
          "Order Name",
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/img2.png"), fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            borderSide: BorderSide(color: Color(0xff9CCDB5))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Color(0xff9CCDB5))),
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Showing all 120 request",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff424242)),
                    )),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 34,
                    width: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: Color(0xff187949)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: Color(0xffFFFFFF),
                          size: 20,
                        ),
                        Text(
                          "Filter",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 4,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    child: Image.asset(
                      "images/img1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Commercial Cleaning Experties",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff272727)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Commercial Cleaning by Experties not simpily\n random text",
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff272727)),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 6,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                        height: 147,
                        color: Color(0xffF8F8F8),
                        width: double.infinity,
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HBO work",
                                  style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff272727)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 25,
                                    ),
                                    Text(
                                      "4.9 (100)",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Total 400 work compelete",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff272727)),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 34,
                                        width: 74,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xff187949)),
                                        child: Center(
                                          child: Text(
                                            "Accept",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 34,
                                        width: 74,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff187949)),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xffF8F8F8)),
                                        child: Center(
                                          child: Text(
                                            "Reject",
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 34,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xff187949)),
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xffF8F8F8)),
                                        child: Center(
                                          child: Text(
                                            "View Conpany Profile",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
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
                        height: 5,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
    ));
  }
}
