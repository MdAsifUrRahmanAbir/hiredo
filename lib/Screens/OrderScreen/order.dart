// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
          "Order",
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff272727)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 35,
                color: Colors.green,
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How often do you \n need cleaning services?",
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff272727)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Amet minim mollit non deserunt ullamco\n est sit aliqua dolor do amet sint",
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff272727)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (contex, index) => Container(
                          height: 55,
                          width: 375,
                          child: Card(),
                        ),
                    separatorBuilder: (_, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 7))
          ],
        ),
      ),
    ));
  }
}
