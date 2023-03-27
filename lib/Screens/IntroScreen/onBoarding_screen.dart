import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/Screens/IntroScreen/introonepage.dart';
import 'package:myapp/Screens/IntroScreen/introtwopage.dart';
import 'package:myapp/Screens/IntroScreen/signupintropage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../SignInScreen/signinpage.dart';

class OnboardinScreen extends StatefulWidget {
  const OnboardinScreen({super.key});

  @override
  State<OnboardinScreen> createState() => _OnboardinScreenState();
}

class _OnboardinScreenState extends State<OnboardinScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 1);
            });
          },
          children: const [IntroOnePage(), IntroTwoPage(), SignIntroPage()],
        ),
        Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      _controller.jumpTo(0);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF187949),
                    )),
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                        spacing: 8.0,
                        radius: 6.0.r,
                        dotWidth: 10.0.w,
                        dotHeight: 10.0.h,
                        dotColor: const Color(0xFF174E31).withOpacity(0.3),
                        activeDotColor: Color(0xFF187949))),
                IconButton(
                    onPressed: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF187949),
                    ))
              ],
            ))
      ]),
    );
  }
}
