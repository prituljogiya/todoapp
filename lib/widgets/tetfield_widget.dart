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
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),
          hintText:hintText,
          prefixIcon: Icon(Icons.person, color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder()),
    );

  }
}
