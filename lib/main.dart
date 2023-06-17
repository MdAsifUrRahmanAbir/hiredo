import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';


import 'Route/routes.dart';

import 'network_check/dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await ScreenUtil.ensureScreenSize();


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
       
         // background: Container(color: const Color(0xFFF5F5F5)),
     
      initialRoute: Routes.splash,
      getPages: getPages,
    );
  }
}
