import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppStyle{
  static Color bgColor= Color(0xffffffff);
  static Color mainColor= Color(0xff000000);
  static Color primaryColor= Color(0xFF0065FF);

  //setting card differently color
  static List<Color> cardColor = [
    Colors.purple,
    Colors.red.shade100,
    Colors.pinkAccent.shade100,
    Colors.green.shade100,
    Colors.grey.shade100,
    Colors.yellow.shade100,
    Colors.orange.shade100,
  ];

  //setting text style
  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.roboto(fontSize: 16.0, fontWeight: FontWeight.normal);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.w500);
}