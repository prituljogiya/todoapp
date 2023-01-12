import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {
  const ReuseableWidget({Key? key,
  this.hinttext,
   }
      ) : super(key: key);
  final String? hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.black,),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),

          hintText: hinttext,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder()),
    );
  }
}
