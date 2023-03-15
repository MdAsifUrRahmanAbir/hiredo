import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class OneClickResponcePage extends StatefulWidget {
  static const String routename = '/one_click';
  OneClickResponcePage({Key? key}) : super(key: key);

  @override
  State<OneClickResponcePage> createState() => _OneClickResponcePageState();
}

class _OneClickResponcePageState extends State<OneClickResponcePage> {
  bool status = false;
  List<String> items = ['Bathroom', 'Kitchen', 'Renovation'];
  String? selectedValue = 'Bathroom';

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
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'One Click Responce',
          style: myStyle(20, FontWeight.bold, Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Color(0xff187949),
              ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                FlutterSwitch(
                  activeColor: themeColorGreen,
                  width: 55.0,
                  height: 28.0,
                  toggleSize: 22.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 4.0,
                  showOnOff: false,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'One Click Responce enabled',
                  style: myStyle(18, FontWeight.w500, textClr),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Email template to be used for your one-click response:',
              style: myStyle(14, FontWeight.w400, textClr),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border.all(color: textClr, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue!,
                    style: myStyle(18, FontWeight.w500, textClr),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: myStyle(18, FontWeight.w500, offWhite),
                      focusColor: themeColorGreen,
                      dropdownColor: scaffoldClr,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Icon(Icons.error_outline),
                SizedBox(width: 3,),
                Expanded(
                    child: Text(
                  'You can view, edit and manage your email templates in email templates',
                  style: myStyle(10, FontWeight.w400, textClr),
                ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration:
                  BoxDecoration(border: Border.all(color: textClr, width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Your one-click response will look like a personal email from you. Any replies to the email will be sent straight to you, meaning you ll hear back from more customers.',
                          textAlign: TextAlign.center,
                          style: myStyle(12, FontWeight.w400, textClr),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.settings,
                                color: themeColorGreenbright,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Customise your templates for your one-click response',
                                textAlign: TextAlign.center,
                                style: myStyle(12, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.autorenew_sharp,
                                color: themeColorGreenbright,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Respond to leads by using the one-click response button',
                                textAlign: TextAlign.center,
                                style: myStyle(12, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.timer,
                                color: themeColorGreenbright,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Customers will receive your response instantly',
                                textAlign: TextAlign.center,
                                style: myStyle(12, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: textformback),
                              child: Icon(
                                Icons.message,
                                color: themeColorGreenbright,
                                size: 18,
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'Follow up with a more personalised message and quote later',
                                textAlign: TextAlign.center,
                                style: myStyle(12, FontWeight.w500, textClr),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You can change your one-click response for future leads above',
                    style: myStyle(12, FontWeight.w400, textClr),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
