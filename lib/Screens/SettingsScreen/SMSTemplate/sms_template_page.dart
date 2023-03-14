import 'package:flutter/material.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';
import 'package:myapp/utils/colors.dart';

class SMSTemplatePage extends StatefulWidget {
  SMSTemplatePage({Key? key}) : super(key: key);

  @override
  State<SMSTemplatePage> createState() => _SMSTemplatePageState();
}

class _SMSTemplatePageState extends State<SMSTemplatePage> {

  List<String> name = ['Visit'];

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
          'SMS Templates',
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My templates',
                  style: myStyle(20, FontWeight.w500, textClr),
                ),
                Container(
                  color: themeColorGreen,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 12,
                        color: scaffoldClr,
                      ),
                      Text(
                        'Add template',
                        style: myStyle(12, FontWeight.w400, scaffoldClr),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: scaffoldClr,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(
                            0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(name[index], style: myStyle(18, FontWeight.w500, textClr),),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                        decoration: BoxDecoration(
                            color: themeColorGreen,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text('Edit', style: myStyle(12, FontWeight.w400, scaffoldClr),),
                      ),
                      SizedBox(width: 10,),
                      IconButton(onPressed: () {

                      }, icon: Icon(Icons.delete_sweep, color: offWhite,))
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: name.length),
            SizedBox(height: 15,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.error_outline, size: 12,),
                SizedBox(width: 5,),
                Text(
                  'Learn more about email templates',
                  style: myStyle(12, FontWeight.w400, offWhite),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
