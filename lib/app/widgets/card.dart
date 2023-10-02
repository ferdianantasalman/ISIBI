import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget card() {
  return Container(
    margin: EdgeInsets.all(3.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Image.asset("assets/images/foto1.webp",
                fit: BoxFit.cover, width: 280.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child:
                    Text('Tips Komunikasi Lancar dengan Teman Tuli Lihat Semua',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 160, 153, 153),
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        )
                        // TextStyle(
                        // fontFamily: "Poppins",
                        // color: const Color.fromARGB(255, 160, 153, 153),
                        // fontSize: 13.0,
                        // fontWeight: FontWeight.bold,
                        // ),
                        ),
              ),
            ),
          ],
        )),
  );

  // return Container(
  //   height: 100,
  //   width: 300,
  //   decoration:
  //       BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
  //   child: ClipRRect(
  //     borderRadius: BorderRadius.circular(20),
  //     child: SizedBox.fromSize(
  //       size: Size.fromRadius(20),
  //       child: Image.asset("assets/sample.jpg", fit: BoxFit.fitWidth),
  //     ),
  //   ),
  // );
}
