import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homelyknock/Screens/IntroScreen/introonepage.dart';
import 'package:homelyknock/Screens/IntroScreen/introtwopage.dart';
import 'package:homelyknock/Screens/IntroScreen/signupintropage.dart';

import 'package:homelyknock/local/my_local.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardinScreen extends StatefulWidget {
  const OnboardinScreen({super.key});

  @override
  State<OnboardinScreen> createState() => _OnboardinScreenState();
}

class _OnboardinScreenState extends State<OnboardinScreen> {
  final PageController _controller = PageController();

  int selectIndex=0;
  List<Widget> page=[const IntroOnePage(), const IntroTwoPage(),];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
              selectIndex=index;
              });
            },
            children: page ,
          ),
          Container(
              alignment: const Alignment(0, 0.9),
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
                      count:2,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                          spacing: 8.0,
                          radius: 6.0.r,
                          dotWidth: 10.0.w,
                          dotHeight: 10.0.h,
                          dotColor: const Color(0xFF174E31).withOpacity(0.3),
                          activeDotColor: const Color(0xFF187949))),
                  IconButton(
                      onPressed: () {
                            if(page.length>selectIndex+1){
                                  _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                            }else{
                                 Get.off(const SignIntroPage());
                                 MyPreference.setOnBoard(true);
                            }
                       
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF187949),
                      ))
                ],
              ))
        ]),
      ),
    );
  }
}
