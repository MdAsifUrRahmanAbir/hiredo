// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractMessageTwo extends StatefulWidget {
  const ContractMessageTwo({super.key});

  @override
  State<ContractMessageTwo> createState() => _ContractMessageTwoState();
}

class _ContractMessageTwoState extends State<ContractMessageTwo> {
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
          title: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/img2.png"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Jasim Uddin",
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff272727)),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Color(0xff353535),
                ))
          ],
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 35,
                  width: 93,
                  child: Card(
                    child: Center(
                      child: Text(
                        "10:20",
                        style: GoogleFonts.roboto(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
