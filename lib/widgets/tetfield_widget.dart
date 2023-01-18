import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTxtField extends StatelessWidget {
  const InputTxtField({
    required this.hintText,
    required this.controller,
    this.validator,
    required this.obsecureText});

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obsecureText,
      style: GoogleFonts.roboto(
        color: Color(0xff888b91),
        fontSize: 20
      ),
      decoration:  InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color(0xff999a9e),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: Color(0xff999a9e),
          ),
        ),
        border: const UnderlineInputBorder(),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: Color(0xff888b91),
          fontSize: 18,
        ),
      ),
    );
  }
}
