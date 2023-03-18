import 'package:flutter/material.dart';

import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/utils/colors.dart';

class SplashPage extends StatefulWidget {
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
    await Future.delayed(const Duration(seconds: 3), () {});

    Navigator.push(context, MaterialPageRoute(builder: (_) => IntroOnePage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: themeColorGreen),
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
