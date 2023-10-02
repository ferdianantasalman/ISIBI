import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isibi/app/controllers/page_index_controller.dart';
import 'package:isibi/app/widgets/card.dart';
import 'package:isibi/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  // final List<String> imgList = [
  //   'assets/foto1.webp',
  //   'assets/foto2.webp',
  //   'assets/foto3.webp',
  //   'assets/foto4.webp',
  //   'assets/foto5.webp',
  //   'assets/foto6.webp'
  // ];

  final pageC = Get.find<PageIndexController>();
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   leading: Container(
        //     width: 30,
        //     height: 30,
        //     child: Image.asset("assets/logo-isibi.png"),
        //   ),
        //   actions: [Icon(Icons.info)],
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset("assets/icons/isibi.png"),
                      ),
                      Icon(Icons.info)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                        child: CarouselSlider(
                      options: CarouselOptions(
                          aspectRatio: 2.2,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                          onPageChanged: ((index, reason) {
                            homeC.changeIndex(index);
                          })),
                      items: homeC.imgList
                          .map((item) => GestureDetector(
                                onTap: () => Get.toNamed(Routes.DETAIL,
                                    arguments: {'test': 'infongab'}),
                                child: Container(
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(item,
                                                fit: BoxFit.cover,
                                                width: 1000.0),
                                            Positioned(
                                              bottom: 0.0,
                                              left: 0.0,
                                              right: 0.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color.fromARGB(
                                                          200, 0, 0, 0),
                                                      Color.fromARGB(0, 0, 0, 0)
                                                    ],
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 20.0),
                                                child: Text(
                                                    'Tips Komunikasi Lancar dengan Teman Tuli Lihat Semua',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ))
                          .toList(),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: homeC.imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          // onTap: () => print("card diklik"),
                          child: Obx(() => Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(homeC.current == entry.key
                                            ? 0.9
                                            : 0.4)),
                              )),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // Container(
                //   height: 120,
                //   child: ListView.separated(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 5,
                //       separatorBuilder: (context, index) => SizedBox(width: 10),
                //       itemBuilder: (context, index) => card()),
                // ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       card(),
                //       SizedBox(width: 10),
                //       card(),
                //       SizedBox(width: 10),
                //       card(),
                //       SizedBox(width: 10),
                //       card(),
                //       SizedBox(width: 10),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pembelajaran",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xff034A9E),
                            fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle),
                          width: 65,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.VIDEO);
                            },
                            child: Image.asset("assets/icons/salam.png"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(1)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Salam",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle),
                          width: 65,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.VIDEO);
                            },
                            child: Image.asset("assets/icons/sapaan.png"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(1)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Kata Sapaan",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle),
                          width: 65,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.VIDEO);
                            },
                            child: Image.asset("assets/icons/angka.png"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(1)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Angka",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle),
                          width: 65,
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.VIDEO);
                            },
                            child: Image.asset("assets/icons/salam.png"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(1)),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Perkenalan",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Informasi Terkini",
                        style: GoogleFonts.poppins(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text("Lihat Semua",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Color(0xff034A9E),
                            fontWeight: FontWeight.bold))
                  ],
                ),
                SizedBox(height: 3),
                Text("Jangan lewatkan informasi terkini dari I-SIBI",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.normal)),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemBuilder: (context, index) => card()),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       card(),
                //       SizedBox(width: 10),
                //       card(),
                //     ],
                //   ),
                // ),
                // Container(
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
                //   color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   height: 100,
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                //         color: Colors.red,
                //         alignment: Alignment.center,
                //         width: 80,
                //         height: 80,
                //         child: Icon(
                //           Icons.face,
                //           size: 70,
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       Container(
                //         color: Colors.red,
                //         padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                //             Text("Realtime Scan Bahasa Gesture",
                //                 style: TextStyle(
                //                     fontSize: 16,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold)),
                //             Text(
                //               "Lorem ipsum dolor sit amet\nconsectetur adipiscing elit\nconsectetur adipiscing elit\nconsectetur adipiscing elit",
                //               style: TextStyle(
                //                   fontSize: 12,
                //                   color: Colors.black38,
                //                   fontWeight: FontWeight.normal),
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: 0,
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
