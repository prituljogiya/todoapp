import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/reuseable/reuse_widget.dart';
import 'package:todoapp/screens/welcome_screen.dart';
import 'home_screen.dart';
import 'package:firebase_core/firebase_core.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey= GlobalKey<ScaffoldState>();
    var passTextController=TextEditingController();
    var confirmPassTextController=TextEditingController();
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
                      padding: const EdgeInsets.only(top: 20, left: 20.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WelcomeScreen()));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
            Container(
              width: 240,
              height: 240,
              child: ReuseableImage(),
            ),
                Text(
                  'Create an account',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    width: 353,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReuseableWidget(icon: Icons.email,hinttext: "Email",controller:emailController,),
                        const SizedBox(
                          height: 20.0,
                        ),
                        RuseablePassword(icon: Icons.security_outlined, isObsecure:true, controller: passTextController,hinttext: "password",),
                        const SizedBox(
                          height: 20.0,
                        ),
                        RuseablePassword(icon: Icons.security_outlined, isObsecure:true, controller: confirmPassTextController,hinttext: "Confirm Password",),
                        /* ReuseableWidget(icon: Icons.security,hinttext: "Password",iconsufix:Icons.visibility,isObsecure: true,controller: passTextController,),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ReuseableWidget(icon: Icons.security,hinttext: "Confirm  Password",iconsufix:Icons.visibility,isObsecure: true,controller: confirmPassTextController,),
                    */  ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    if(_formKey.currentState!.validate())
                    {
                      showSuccessSnackBar("Register Successful");
                    }
                    else
                    {
                      showErrorSnackBar("Registration failed");
                    }
                   /* try {
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passTextController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }*/

                   FirebaseAuth.instance.createUserWithEmailAndPassword(email:emailController.text, password:passTextController.text).then((value) {
                     print("Creaed a New  UserAccount");
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => HomeScreen()));
                   }).onError((error, stackTrace) {
                     print("Error ${error.toString()}");
                   });


                  },
                  child: Container(
                    height: 53,
                    width: 353,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text("Create account",
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
                      "Already have an account?",
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
                                builder: (context) => LogInscreen()));
                      },
                      child: Text(
                        "Log In",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
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
