import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen()));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Image.asset('assets/notes.png',
              height: 200,),
          ],
        ) ,
      ),
    );
  }
}
