import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/EmailVerifiyScreen/enterverificationpage.dart';

import '../../utils/colors.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String routename = '/resetpasspage';
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

final passwordController = TextEditingController();
final confirmpasswordController = TextEditingController();
String errMsg = '';
bool visiblepass = false;
bool visiblepass2 = false;

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
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
                    Navigator.pushReplacementNamed(
                        context, VerificationPage.routename);
                  },
                )),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: GoogleFonts.roboto(color: Colors.black.withOpacity(0.7)),
              ),
              Text(
                'Create a new password',
                style: GoogleFonts.roboto(
                    fontSize: 15, color: Colors.black.withOpacity(0.6)),
              )
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'New Password',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Color(0xff25302B),
                      fontWeight: FontWeight.w400),
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
                              icon: Icon(Icons.visibility, color: Colors.black))
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
                      color: Color(0xff25302B),
                      fontWeight: FontWeight.w400),
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
                              icon: Icon(Icons.visibility, color: Colors.black))
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
                  height: 28,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 22,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: themeColorGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Save',
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
