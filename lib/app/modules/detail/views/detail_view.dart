import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isibi/app/controllers/page_index_controller.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  // final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/foto1.webp"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: 16,
                    left: 13,
                    child: Container(
                      child: Icon(Icons.arrow_back_rounded),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                Positioned(
                    bottom: 85,
                    left: 13,
                    child: Container(
                      child: Text(
                        "Artikel Berita",
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xffF79824),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                Container(
                  height: height * 0.09,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(13, 10, 0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Tips Komunikasi Lancar dengan Teman Tuli",
                            maxLines: 2,
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 5, 0, 0),
              child: Row(
                children: [
                  Text(
                    "Trending ",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "7 jam yang lalu",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 10, 0, 0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
            )
          ],
        )),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 60,
      //   index: 0,
      //   color: Color(0xff034A9E),
      //   animationCurve: Curves.bounceInOut,
      //   animationDuration: Duration(milliseconds: 300),
      //   backgroundColor: Colors.white,
      // style: TabStyle.fixedCircle,
      // items: [
      //   Icon(
      //     Icons.home,
      //     size: 40,
      //   ),
      //   Icon(
      //     Icons.handshake,
      //     size: 40,
      //   ),
      //   Icon(
      //     Icons.newspaper,
      //     size: 40,
      //   )
      // ],
      // onTap: (index) {
      // pageC.changePage(index);
      // },
      // )
    );
  }
}
