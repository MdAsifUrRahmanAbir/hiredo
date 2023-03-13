import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/Route/route.dart';
import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/utils/colors.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigatesplash();
    super.initState();
  }

  void _navigatesplash() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Get.offNamed(introPageOne);
    //Navigator.push(context, MaterialPageRoute(builder: (_) => IntroOnePage()));
    // Navigator.pushNamed(context, IntroOnePage.routename);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: themeColorGreen),
            child: ClipRRect(
                child: Image.asset(
              'images/ring.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )),
          ),
        ),
      ),
    );
  }
}
