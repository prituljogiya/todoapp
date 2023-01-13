import 'package:flutter/material.dart';

class ReuseableWidget extends StatefulWidget {
  const ReuseableWidget({Key? key,
  this.hinttext,
    required this.icon,
    this.iconsufix,
   this.isObsecure = false,
   }
      ) : super(key: key);
  final String? hinttext;
  final  IconData icon;
  final  IconData? iconsufix;
  final bool isObsecure;
  @override
  State<ReuseableWidget> createState() => _ReuseableWidgetState();
}

class _ReuseableWidgetState extends State<ReuseableWidget> {
  @override
  Widget build(BuildContext context) {
bool obsecureText = false;
initState(){
  obsecureText=widget.isObsecure;
  super.initState();
}
    return TextField(
      obscureText: widget.isObsecure,
      style: TextStyle(color: Colors.black,),
      decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),

          hintText: widget.hinttext,
          prefixIcon:Icon(
            widget.icon
          ),
          suffixIcon :Icon(
            widget.iconsufix
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder()),
    );
  }
}


class ReuseableImage extends StatelessWidget {
  const ReuseableImage ({Key? key,
   // required this.image,
  }
      ) : super(key: key);
  // final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image(
          image: AssetImage('assets/notes.png'),
        ));
  }
}
