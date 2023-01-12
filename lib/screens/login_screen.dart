import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/reuseable/reuse_widget.dart';
import 'package:todoapp/screens/signup_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';

import '../style/app_style.dart';

class LogInscreen extends StatefulWidget {
  const LogInscreen({Key? key}) : super(key: key);

  @override
  State<LogInscreen> createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen> {
  bool _obscureText= true;

  @override
  Widget build(BuildContext context) {
    var passText=TextEditingController();
    var email=TextEditingController();
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20.0),
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                      },
                      child: Icon(Icons.arrow_back,
                        color: Colors.white,)),
                ),
              ],
            ),
              Center(
                  child: Image(
                image: AssetImage('assets/notes.png'),
              )),
              ReuseableWidget(hinttext: "Email"),
              ReuseableWidget(hinttext: "password"),
              Text(
                'Sign In',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Center(
                child: Container(
                  width: 353,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(                   //email textfield
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: email=TextEditingController(),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide()),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.email),
                              onPressed: () {},
                            ),
                            hintText: "Email",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        //password textfield
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        obscureText: _obscureText,
                        controller: passText=TextEditingController(),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide()),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.lock),
                              onPressed: () {},
                            ),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                _obscureText =!_obscureText;
                              });
                            },
                            child: Icon(_obscureText ? Icons.visibility : Icons
                                .visibility_off),
                          ),
                          hintText: "password",
                            // helperText:"Password must contain special character",
                            // helperStyle:TextStyle(color:Colors.white),
                            filled: true,
                            fillColor: Colors.white,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                },
                child: Container(
                  height: 53,
                  width: 353,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text("Sign In",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                    },
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                    ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        )));
  }
}
