import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/home_screen/home_screen.dart';
import 'package:todoapp/signup_screen/signup_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';
import '../reuseable/reuse_widget.dart';
import '../style/app_style.dart';

class LogInscreen extends StatefulWidget {
  const LogInscreen({Key? key}) : super(key: key);

  @override
  State<LogInscreen> createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText= true;


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
    var passTextController=TextEditingController();
    var emailController=TextEditingController();
    return Scaffold(
      key: scaffoldKey,
        backgroundColor: Colors.black,
        body: Form(
          key: _formKey,
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 20.0),
                    child: InkWell(
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
                          },
                          child: Icon(Icons.arrow_back,
                          color: Colors.white,)),
                  ),
                ],
              ),
              ReuseableImage(),
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
                          ReuseableWidget(
                            icon: Icons.email,
                            hinttext: "Email",
                            controller: emailController,
                          ),
                          const SizedBox(
                          height: 20.0,
                        ),
                          ReuseablePass(
                            icon: Icons.security,
                            controller: passTextController,
                          )
                    ]
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async{

                    if(_formKey.currentState!.validate())
                    {
                      showSuccessSnackBar("LogIn Successful");
                    }
                    else
                    {
                      showErrorSnackBar("Log In failed");
                    }
                    FirebaseAuth auth = FirebaseAuth.instance;
                    FirebaseFirestore db = FirebaseFirestore.instance;
                    final String email = emailController.text;
                    final String password = passTextController.text;
                      try {
                        UserCredential userCredential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                       await prefs.setString(email,email!) ;
                       await prefs.setString(password,password!);


                        if (userCredential.user != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('User Not Found')));
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text('Invalid Password')));
                        }
                      }


                    /*FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passTextController.text)
                        .then((value) {
                      print(" successfully login");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });*/
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
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
          )),
        ));
  }

  void showSuccessSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 200),

      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 200),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
