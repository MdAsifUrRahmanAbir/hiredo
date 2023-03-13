import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Route/route.dart';
import 'package:myapp/Screens/LeadsScreen/lead_screen.dart';
import 'package:myapp/Screens/MyResponse/my_response.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/Screens/SignInScreen/signinpage.dart';
import 'package:myapp/Screens/UpdateLeadSetting/update_lead_settings.dart';
import 'package:myapp/utils/colors.dart';

import '../LocationScreen/locationpage.dart';

class Profile extends StatefulWidget {
  static const String routename = '/profile';
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

double _progressValue = 0.8;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double scw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_backspace_rounded,
            color: themeColorGreen,
            size: 28,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 23, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_none_outlined,
              color: themeColorGreen,
              size: 28,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 63,
                  width: scw - 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 63,
                            width: 63,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(90)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(90)),
                              child: Image.asset(
                                "images/profilepic.png",
                                height: 63,
                                width: 63,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Built wright inc',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'info@builtwrightinc.com',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("images/switchimg.png"),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.more_vert)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: scw - 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEDED),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Your profile is 80% complete",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w400),
                            ),
                            Image.asset(
                              "images/editicon.png",
                              height: 22,
                              width: 22,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 8,
                              width: scw - 110,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    themeColorGreen),
                                value: _progressValue,
                              ),
                            ),
                            const Text(
                              '8/10',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        const Text(
                          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 167,
                  width: 371,
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEEEDED),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OverView',
                        style: GoogleFonts.roboto(
                            color: const Color(0xFF272727),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('images/eliteicon.png'),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Elite Pro',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('images/tick.png'),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '14 Hires on Ringknock',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('images/moon.png'),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '7 Years in business',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('images/tick.png'),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '6 Hour response  time',
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF272727)),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '11-50 Staff',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF272727)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 152,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  color: const Color(0xFFEEEDED),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Service Tags',
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF272727)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Bathroom_installation',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF187949)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '#Bathroom_installation',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Kitchen Refurbishment',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            '#Kitchen Design & Planning',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            '#Kitchen Refurbishment',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF272727)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'View More',
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF187949)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(leadscreen);

                        // Navigator.pushReplacementNamed(
                        //     context, LeadsScreen.routename);

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => LeadsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: themeColorGreen,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Leads',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: themeColorGreen.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  '416',
                                  style: TextStyle(
                                      fontSize: 12, color: themeColorGreen),
                                )),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: themeColorGreen,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(myresponse);

                        // Navigator.pushReplacementNamed(
                        //     context, MyResponse.routename);

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => MyResponse()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.sports_handball_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'My Responces',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  '416',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )),
                              ),
                              const Icon(Icons.navigate_next),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Wishlist',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(settings);
                        // Navigator.pushReplacementNamed(
                        //     context, SettingsPage.routename);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => SettingsPage()));
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.settings,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Settings',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Help',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Icon(Icons.navigate_next),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: InkWell(
                      onTap: () {
                        Get.offNamed(updateleadsettings);

                        // Navigator.pushReplacementNamed(
                        //     context, UpdateLeadSettings.routename);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => UpdateLeadSettings()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.rotate_right,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Services',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 18,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  '50',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                )),
                              ),
                              Icon(Icons.navigate_next),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: scw - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.offNamed(location);

                            // Navigator.pushReplacementNamed(
                            //     context, LocationPage.routename);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => LocationPage()));
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Locations',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 18,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                '50',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              )),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 43,
                    width: scw / 2 - 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.offNamed(signin);

                          // Navigator.pushReplacementNamed(
                          //     context, SignInPage.routename);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDF2929),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
