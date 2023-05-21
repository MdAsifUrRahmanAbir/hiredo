import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'Route/routes.dart';
import 'Services/api_component.dart';
import 'network_check/dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();

  Stripe.publishableKey = stripePublishKey;
  InternetCheckDependencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 928));
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
      initialRoute: Routes.splash,
      getPages: getPages,
    );
  }
}
