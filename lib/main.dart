import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:isibi/app/controllers/page_index_controller.dart';
import 'package:isibi/app/widgets/splash.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(PageIndexController(), permanent: true);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.transparent, // navigation bar color
  //   statusBarColor: Colors.transparent, // status bar color
  // ));

  runApp(Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "ISIBI",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            return GetMaterialApp(
                title: "ISIBI",
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes);
          }
        });
  }
}
