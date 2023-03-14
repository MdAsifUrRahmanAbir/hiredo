// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/SignUpAccountScreen/signupaccountchoosepage.dart';

import '../../utils/colors.dart';

class RegistrationPage extends StatefulWidget {
  static const String routename = '/registrationpage';
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();
final nameController = TextEditingController();
final dateController = TextEditingController();
final numberController = TextEditingController();
final corpunameController = TextEditingController();
final corpunumController = TextEditingController();
String errMsg = '';
bool visiblepass = false;
bool visiblepass2 = false;

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
                      //     context, SignAccountChoosePage.routename);
                    },
                  )),
            ),
            title: Text(
              'Registration',
              style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff555957)),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full name',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Enter full name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enter your email',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Password',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !visiblepass,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        //prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        suffixIcon: visiblepass
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass
                                        ? visiblepass = false
                                        : visiblepass = true;
                                  });
                                },
                                icon:
                                    Icon(Icons.visibility, color: Colors.black))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass
                                        ? visiblepass = false
                                        : visiblepass = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Confirm Password',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: confirmpasswordController,
                    obscureText: !visiblepass2,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        //prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        suffixIcon: visiblepass2
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass2
                                        ? visiblepass2 = false
                                        : visiblepass2 = true;
                                  });
                                },
                                icon:
                                    Icon(Icons.visibility, color: Colors.black))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    visiblepass2
                                        ? visiblepass2 = false
                                        : visiblepass2 = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off,
                                  color: Colors.black,
                                )),
                        hintText: '********',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Date of birth',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '01/01/2000',
                        suffixIcon: Icon(Icons.calendar_today)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Number',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '+880100000000'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Corporate Name',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: corpunameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: 'Frelence learning center'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Corporate Number',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: corpunumController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),

                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),

                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5)),
                        border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0)),
                        hintText: '+980000000'),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  SizedBox(
                    height: 50,
                    width: scwidth - 18,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: themeColorGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          // Navigator.pushReplacementNamed(
                          //     context, SignInPage.routename);
                          //Get.offNamed(signin);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignInPage()));
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF)),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
