// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Route/route.dart';
import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';

import '../../utils/colors.dart';

class ForegPasswordPage extends StatefulWidget {
  static const String routename = '/forgetpasswordpage';
  const ForegPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForegPasswordPage> createState() => _ForegPasswordPageState();
}

String? accounttype = "phone";
final phoneController = TextEditingController();

class _ForegPasswordPageState extends State<ForegPasswordPage> {
  @override
  Widget build(BuildContext context) {
    double scheight = MediaQuery.of(context).size.height;
    double scwidth = MediaQuery.of(context).size.width;
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
                    //     context, SignInPage.routename);
                  },
                )),
          ),
          title: Text(
            'Forgot Password?',
            style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.5)),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        activeColor: themeColorGreen,
                        title: Text('Phone'),
                        value: "phone",
                        groupValue: accounttype,
                        onChanged: (value) {
                          setState(() {
                            accounttype = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        activeColor: themeColorGreen,
                        title: Text('Email'),
                        value: "email",
                        groupValue: accounttype,
                        onChanged: (value) {
                          setState(() {
                            accounttype = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                accounttype == 'phone'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Your Phone',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555957)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: themeColorGreen.withOpacity(0.1),
                                //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                hintText: '+880100000000'),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Your Email',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555957)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: themeColorGreen.withOpacity(0.1),
                                //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0.5)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0)),
                                hintText: 'h@gmail.com'),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 38,
                ),
                SizedBox(
                  height: 50,
                  width: scwidth - 18,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeColorGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Get.offNamed(verification);
                        // Navigator.pushReplacementNamed(
                        //     context, VerificationPage.routename);
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
