import 'package:flutter/material.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class BadgesSecondPage extends StatefulWidget {
  const BadgesSecondPage({Key? key}) : super(key: key);

  @override
  State<BadgesSecondPage> createState() => _BadgesSecondPageState();
}

class _BadgesSecondPageState extends State<BadgesSecondPage> {
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xff187949),
            )),
        title: Text(
          'Badges',
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
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: containerClr),
              child: Row(
                children: [
                  Image.asset('images/badges.png'),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Golden Badges',
                        style:
                            myStyle(18, FontWeight.w500, themeColorGreenbright),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys. ',
                        style: myStyle(14, FontWeight.w400, offWhite),
                      )
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You are  In Golden Badge Member',
                  style: myStyle(14, FontWeight.w400, textClr),
                ),
                Text(
                  '2/3',
                  style: myStyle(14, FontWeight.w500, textClr),
                )
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: themeColorGreen),
                )),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                    child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: themeColorGreen),
                )),
                SizedBox(
                  width: 1,
                ),
                Expanded(
                    child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: textformback),
                )),
              ],
            ),
            SizedBox(height: 15,),
            Text(
              'Golden Badge Advantage',
              style: myStyle(18, FontWeight.w500, textClr),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
              style: myStyle(14, FontWeight.w400, textClr),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 18,
                  color: themeColorGreen,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  'Lorem Ipsum is simply dummy text of has been the industrys. Lorem Ipsum is simply dummy text of the printing.',
                  style: myStyle(14, FontWeight.w400, offWhite),
                ))
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  size: 18,
                  color: themeColorGreen,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  'Lorem Ipsum is simply dummy text of has been the industrys. Lorem Ipsum is simply dummy text of the printing.',
                  style: myStyle(14, FontWeight.w400, offWhite),
                ))
              ],
            ),
            SizedBox(height: 15,),
            Text(
              'Bye/Sale More Services And get Dimond Badge',
              style: myStyle(18, FontWeight.w500, textClr),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys.',
              style: myStyle(14, FontWeight.w400, offWhite),
            ),
            SizedBox(height: 20,),
            Text('See How to get Dimond Badge Member', style: myStyle(18, FontWeight.w500, themeColorGreenbright),)
          ],
        ),
      ),
    );
  }
}
