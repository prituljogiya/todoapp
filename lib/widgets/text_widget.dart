import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key,
    required this.title,
    required this.txtSize,
    required this.txtColor}) : super(key: key);
  final String title;
  final double txtSize;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize:txtSize,
        fontWeight: FontWeight.bold,
        color: txtColor,
      ),
    );
  }
}

