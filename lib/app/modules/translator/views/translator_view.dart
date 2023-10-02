import 'package:camera/camera.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isibi/app/controllers/page_index_controller.dart';

import '../controllers/translator_controller.dart';

class TranslatorView extends GetView<TranslatorController> {
  final pageC = Get.find<PageIndexController>();
  final translatorC = Get.find<TranslatorController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final myAppbar = AppBar(
      title: Text("Translator"),
    );

    final bodyHeight = size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Penerjemah",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              // color: Colors.amber,
              width: size.width,
              height: bodyHeight * 0.6,
              child: GetBuilder<TranslatorController>(
                  init: TranslatorController(),
                  builder: (controller) {
                    return controller.isCameraInitialized.value
                        ? CameraPreview(controller.cameraController)
                        : Center(
                            child: Text(
                              "Loading Preview",
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 15),
                            ),
                          );
                    // ? Stack(
                    //     children: [
                    //       CameraPreview(controller.cameraController),
                    //       Positioned(
                    //         top: (controller.y) * 700,
                    //         right: (controller.x) * 500,
                    //         child: Container(
                    //           width: controller.w * 100 * context.width,
                    //           height:
                    //               controller.h * 100 * context.height / 100,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8),
                    //               border: Border.all(
                    //                   color: Colors.green, width: 4.0)),
                    //           child: Column(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               Container(
                    //                   color: Colors.white,
                    //                   child: Text(controller.label))
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   )
                    // : Center(
                    //     child: Text(
                    //       "Loading Preview",
                    //       style: GoogleFonts.poppins(
                    //           color: Colors.black, fontSize: 15),
                    //     ),
                    //   );
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              width: size.width,
              height: bodyHeight * 0.2,
              child: Center(
                  child: Column(
                children: [
                  Text(
                    "Terjemahan",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      controller.label,
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: 1,
          color: Color(0xff034A9E),
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.white,
          // style: TabStyle.fixedCircle,
          items: [
            Icon(
              Icons.home,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.handshake,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.newspaper,
              size: 40,
              color: Colors.white,
            )
          ],
          onTap: (index) {
            pageC.changePage(index);
          },
        ));
  }
}
