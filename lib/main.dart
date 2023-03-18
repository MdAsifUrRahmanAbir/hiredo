import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:myapp/Screens/SplashScreen/splashscreen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, child) => ResponsiveWrapper.builder(child,
                maxWidth: 1200,
                minWidth: 360,
                defaultScale: true,
                breakpoints: [
                  const ResponsiveBreakpoint.resize(360, name: MOBILE),
                  const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: const Color(0xFFF5F5F5))),
            initialRoute: "/",
            home: SplashPage(),
          );
        });
  }
}
