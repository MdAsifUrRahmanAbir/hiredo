// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Route/route.dart';
import 'package:myapp/Screens/ResistrationScreen/registrationpage.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/utils/colors.dart';

class SignAccountChoosePage extends StatefulWidget {
  static const String routename = '/accountselectionpage';
  const SignAccountChoosePage({Key? key}) : super(key: key);

  @override
  State<SignAccountChoosePage> createState() => _SignAccountChoosePageState();
}

String? accounttype;

class _SignAccountChoosePageState extends State<SignAccountChoosePage> {
  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      topRight: Radius.circular(90),
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: themeColorGreen,
                  ),
                  onPressed: () {
                    // Navigator.pushReplacementNamed(
                    //     context, SignIntroPage.routename);
                  },
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(children: [
            SizedBox(
              height: 180,
            ),
            Text(
              '''Choose your account
          category''',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff555957)),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Choose',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff555957)),
                ),
                Text(
                  ' become a professional ',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'option and',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff555957)),
                )
              ],
            ),
            Text(
              'continue',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff555957)),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  title: Text(
                    'Become a User',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF373737)),
                  ),
                  trailing: Radio(
                    activeColor: themeColorGreen,
                    value: 'User',
                    groupValue: accounttype,
                    onChanged: (value) {
                      setState(() {
                        accounttype = value.toString();
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  title: Text(
                    'Become a Professional',
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF373737)),
                  ),
                  trailing: Radio(
                    activeColor: themeColorGreen,
                    value: 'Professional',
                    groupValue: accounttype,
                    onChanged: (value) {
                      setState(() {
                        accounttype = value.toString();
                      });
                    },
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                // Navigator.pushReplacementNamed(
                //     context, RegistrationPage.routename);
                Get.offNamed(registration);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF187949),
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    'Next',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
