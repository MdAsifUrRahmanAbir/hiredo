// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/Screens/IntroScreen/introtwopage.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:myapp/nav_bar_page/nav_bar_controller.dart';
import 'package:myapp/utils/colors.dart';

import '../ForgetPasswordScreen/forgotpasswordpage.dart';

class SignInPage extends StatefulWidget {
  static const String routename = '/signinpage';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
String errMsg = '';
String dont = "Don't have an account?";
bool visiblepass = false;
bool isChecked = false;

class _SignInPageState extends State<SignInPage> {
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
                    //     context, IntroTwoPage.routename);
                    Navigator.pop(context);
                  },
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Sign in to your account',
                      style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Email',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff555957)),
                              ),
                              Text(
                                '*',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff555957)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textformback.withOpacity(0.62),
                                  // prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  hintText: '   Enter your email'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Password',
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff555957)),
                              ),
                              Text(
                                '*',
                                style: GoogleFonts.roboto(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !visiblepass,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textformback.withOpacity(0.62),
                                  // prefixIcon: Icon(Icons.lock_outlined,color: Colors.black,),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              themeColorGreen.withOpacity(0.20),
                                          width: 1)),
                                  suffixIcon: visiblepass
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              visiblepass
                                                  ? visiblepass = false
                                                  : visiblepass = true;
                                            });
                                          },
                                          icon: Icon(Icons.visibility,
                                              color: Color(0xFF555957)))
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
                                            color: Color(0xFF555957),
                                          )),
                                  hintText: '   ********',
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Checkbox(
                            activeColor: themeColorGreen,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Remember me',
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555957)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: scwidth - 15,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: themeColorGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BottomNavController()));
                            // Get.offNamed(bottomnav);
                          },
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                        onPressed: () {
                          // Navigator.pushReplacementNamed(
                          //     context, ForegPasswordPage.routename);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForegPasswordPage()));
                          // Get.offNamed(forget);
                        },
                        child: Text(
                          'Forgot the password?',
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: themeColorGreen),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dont,
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff555957)),
                        ),
                        TextButton(
                            onPressed: () {
                              // Navigator.pushReplacementNamed(
                              //     context, SignIntroPage.routename);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignIntroPage()));
                              // Get.offNamed(signinintropage);
                            },
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff555957)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
