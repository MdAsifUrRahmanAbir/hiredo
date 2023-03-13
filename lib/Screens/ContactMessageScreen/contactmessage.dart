// ignore_for_file: prefer_const_constructors, unused_field, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractMessage extends StatefulWidget {
  const ContractMessage({super.key});

  @override
  State<ContractMessage> createState() => _ContractMessageState();
}

class _ContractMessageState extends State<ContractMessage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  var selected = 0;
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
          "Message",
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
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
                        padding: EdgeInsets.all(10.0),
                        color: Color(0xff187949),
                        height: 50,
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Filter",
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF)),
                            ),
                            Icon(
                              Icons.filter_list,
                              color: Color(0xffFFFFFF),
                              size: 15,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                height: 34,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: (() {
                          setState(() {
                            selected = index;
                          });
                        }),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: selected == index
                                          ? Colors.white
                                          : Color(0xff187949)),
                                  borderRadius: BorderRadius.circular(6),
                                  color: selected == index
                                      ? Color(0xff187949)
                                      : Colors.white),
                              child: Text(
                                "All Chat",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: selected == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                          ],
                        ),
                      );
                    }),
                    separatorBuilder: (_, index) => SizedBox(
                          width: 10,
                        ),
                    itemCount: 10),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                        color: Color(0xffFFFFFF),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 67,
                        width: 376,
                        child: Card(
                          elevation: 0,
                          child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("images/img3.png"),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle),
                              ),
                              title: Text(
                                "Sayed",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff272727)),
                              ),
                              subtitle: Text(
                                "Yes I'm Good.",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff424242)),
                              ),
                              trailing: Text(
                                "10:17",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff424242)),
                              )),
                        ),
                      ),
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
    ));
  }
}
