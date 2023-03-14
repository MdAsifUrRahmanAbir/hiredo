import 'package:flutter/material.dart';
import 'package:myapp/Screens/SettingsScreen/setting_page.dart';

class EliteProPage extends StatefulWidget {
  EliteProPage({Key? key}) : super(key: key);

  @override
  State<EliteProPage> createState() => _EliteProPageState();
}

class _EliteProPageState extends State<EliteProPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(child: Text('Elite Pro Page')),
    );
  }
}
