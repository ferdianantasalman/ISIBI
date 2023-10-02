import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isibi/app/controllers/page_index_controller.dart';
// import 'package:isibi/app/data/models/detail_news.dart';
import 'package:isibi/app/data/models/news.dart';
import 'package:isibi/app/widgets/card.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  final pageC = Get.find<PageIndexController>();
  final newsC = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Artikel",
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Obx(() => ListView.builder(
            itemCount: newsC.data.length,
            itemBuilder: (context, index) {
              final newsItem = newsC.data[index];
              return ListTile(
                leading: Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  height: 50,
                  width: 50,
                  // child: Image.network(
                  //   newsItem['author'],
                  //   fit: BoxFit.fill,
                  // ),
                ),
                title: Text(newsItem['title']),
                subtitle: Text(newsItem['url']),
                onTap: () {
                  // Handle tap event (e.g., open news article)
                },
              );
            })),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          index: 2,
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
