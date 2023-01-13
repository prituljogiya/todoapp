import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/reuseable/reuse_widget.dart';
import 'package:todoapp/screens/signup_screen.dart';
import 'package:todoapp/style/app_style.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        body: SafeArea(
            child: Column(
          children: [
            const Center(
                child:ReuseableImage()),
            Text(
              'your notes',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LogInscreen(),
                    ));
              },
              child: Container(
                height: 53,
                width: 353,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: Center(child: Text("Sign In",
                    style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,)
                )),
              ),
            ),
            SizedBox(height: 20.0,),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignUpScreen(),
                    ));
              },
              child: Container(
                height: 53,
                width: 353,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                ),
                child: Center(child: Text("Create an Account",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,)
                )),
              ),
            )
          ],
        )));
  }
}
