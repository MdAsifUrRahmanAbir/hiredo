import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class AccountDetailsPage extends StatefulWidget {
  AccountDetailsPage({Key? key}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldClr,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'Settings',
          style: myStyle(20, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Details',
              style: myStyle(20, FontWeight.w500, textClr),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              color: containerClr,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: themeColorGreenbright,
                    size: 27,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: RichText(
                          text: TextSpan(
                              text:
                                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet',
                              style: myStyle(14, FontWeight.w400, textClr),
                              children: <TextSpan>[
                            TextSpan(
                                text: ' Learn More',
                                style: myStyle(
                                    14, FontWeight.w400, themeColorGreen))
                          ])),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: .7, color: offWhite.withOpacity(0.3)),
                      bottom: BorderSide(width: .7, color: offWhite.withOpacity(0.3)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact details', style: myStyle(16, FontWeight.w400, textClr),),
                  Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.', style: myStyle(14, FontWeight.w400, textClr),),
                  SizedBox(height: 15,),
                  Text(
                    'Account email',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: '+suppose@gmail.com'),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Preferred contact number',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: '01888888888'),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'SMS notification number',
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff555957)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: themeColorGreen.withOpacity(0.1),
                        //prefixIcon: Icon(Icons.email_outlined,color: Colors.black,),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: '01888888888'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text('Change Password', style: myStyle(16, FontWeight.w400, textClr),),
            Text('Amet minim mollit non deserunt', style: myStyle(14, FontWeight.w400, offWhite),),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
             decoration: BoxDecoration(
               color: themeColorGreen,
               borderRadius: BorderRadius.circular(4)
             ),
              child: Text('Change Password', style: myStyle(14, FontWeight.w400, scaffoldClr),),
            )
          ],
        ),
      ),
    );
  }
}
