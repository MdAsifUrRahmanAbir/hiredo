// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Route/route.dart';
import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';

import '../../utils/colors.dart';

class IntroTwoPage extends StatefulWidget {
  static const String routename = '/introtwopage';
  const IntroTwoPage({Key? key}) : super(key: key);

  @override
  State<IntroTwoPage> createState() => _IntroTwoPageState();
}

class _IntroTwoPageState extends State<IntroTwoPage> {
  @override
  Widget build(BuildContext context) {
    double sch = MediaQuery.of(context).size.height;
    double scw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 1,
              ),
              Image.asset(
                'images/img2.png',
                width: scw,
                height: sch / 2,
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  children: [
                    Text(
                      'Easy to your on demand service',
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555957)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ringknock is an online on demand service.'
                      'It has as into 50k+ services. You can buy every onto a service',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff555957)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigator.pushReplacementNamed(
                        //     context, IntroOnePage.routename);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.chevron_left,
                          color: themeColorGreen, size: 25),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 12,
                        ),
                        Icon(Icons.circle, color: themeColorGreen, size: 12),
                        Icon(Icons.circle, color: Colors.grey, size: 12)
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Get.offNamed(signin);

                        // Navigator.pushReplacementNamed(
                        //     context, SignInPage.routename);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => SignInPage()));
                      },
                      icon: Icon(Icons.chevron_right_outlined,
                          color: themeColorGreen, size: 25),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
