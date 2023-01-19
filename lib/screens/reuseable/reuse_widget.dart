import 'package:flutter/material.dart';

class ReuseableWidget extends StatefulWidget {
  const ReuseableWidget({
    Key? key,
    this.hinttext,
    required this.icon,
    this.iconsufix,
    this.isObsecure = false,
    required this.controller,
  }) : super(key: key);
  final String? hinttext;
  final IconData icon;
  final IconData? iconsufix;
  final bool isObsecure;
  final TextEditingController controller;

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
    return TextFormField(
      validator: (email) {
        //  validator: (item) => item!.contains("@")  ?  null : "Enter a Valid Email",
        if(email!.isEmpty || !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email))
        {
          return( "Enter a Valid Email");
        }
        else
        {
          return null;
        };

      },
      controller: widget.controller,
      obscureText: widget.isObsecure,
      style: TextStyle(color: Colors.black,),
      //validator: validate,
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
class ReuseablePass extends StatefulWidget {
  const ReuseablePass({Key? key,
    this.hinttext,
    required this.icon,
    this.iconsufix,
    // required this.isObsecure,
    required this.controller
  }) : super(key: key);
  final String? hinttext;
  final  IconData icon;
  final  IconData? iconsufix;
  // final bool isObsecure;
  final TextEditingController controller;

  @override
  State<ReuseablePass> createState() => _ReuseablePassState();
}

class _ReuseablePassState extends State<ReuseablePass> {
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val){
        if(val!.isEmpty)
          return 'Enter Atleast 6 Characters';
        return null;
      },
      //validator: (item) => item!.length>6 ? null :"Enter Atleast 6 Characters",
      controller: widget.controller,
      obscureText:_obscureText ,
      style: TextStyle(color: Colors.black,),
      //validator: validate,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),

          hintText:"password",

          prefixIcon:Icon(
              widget.icon
          ),
          suffixIcon : GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
            Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),

          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder()),
    );
  }
}


