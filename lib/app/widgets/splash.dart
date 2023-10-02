import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: Get.width * 0.5,
            height: Get.height * 0.5,
            child: Image.asset("assets/icons/logo-isibi.png"),
          ),
        ),
      ),
    );
  }
}
