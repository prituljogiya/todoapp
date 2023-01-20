import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/login_screen/login_screen.dart';
import 'package:todoapp/screens/reuseable/reuse_widget.dart';
import 'package:todoapp/screens/welcome_screen.dart';
import 'package:todoapp/widgets/text_widget.dart';
import '../home_screen/home_screen.dart';
import '../reuseable/reuse_widget.dart';
import '../validator/validator.dart';
import '../widgets/tetfield_widget.dart';

import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
     final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var passTextController = TextEditingController();
    var nameController = TextEditingController();
    var emailController = TextEditingController();
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
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()));
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
                TextWidget(title: 'Create an Account', txtSize: 22, txtColor: Colors.white,),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    width: 353,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputTxtField(hintText: "Your Name", controller: nameController, obsecureText: false,validator:nameValidator ,),
                        const SizedBox(
                          height: 20,
                        ),
                        InputTxtField(hintText: "Email", controller: emailController, obsecureText: false,validator:emailValidator ,),
                        const SizedBox(
                          height: 20,
                        ),
                        InputTxtField(hintText: "Your Password", controller: passTextController, obsecureText: true,validator:passwordValidator ,),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      showSuccessSnackBar("Register Successful");
                    } else {
                      showErrorSnackBar("Registration failed");
                    }
                    FirebaseAuth auth = FirebaseAuth.instance;
                    FirebaseFirestore db = FirebaseFirestore.instance;
                    final String email = emailController.text;
                    final String name = nameController.text;
                    final String password = passTextController.text;


                    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    try{
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                       UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
                      await db.collection('users').doc(userCredential.user!.uid).set({
                        name: name,
                        email: email,
                        password: password,
                      });
                      User? user = userCredential.user;
                      print(user);



                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)
                        ,
                      );
                    }on FirebaseAuthException catch(error, stackTrace){
                      print("Error ${error.toString()}");
                    }
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
      duration: const Duration(milliseconds: 400),
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
/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/widgets/tetfield_widget.dart';

import '../widgets/text_widget.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({Key? key}) : super(key: key);

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {

  TextEditingController nameCntroller =TextEditingController();
  TextEditingController emailCntroller =TextEditingController();
  TextEditingController passwordCntroller =TextEditingController();
  bool obsecureText = true;

  @override
  void dispose() {
    super.dispose();
    nameCntroller.dispose();
    emailCntroller.dispose();
    passwordCntroller.dispose();
  }
  void regsiter() async{
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseFirestore db = FirebaseFirestore.instance;
    final String email = emailCntroller.text;
    final String name = nameCntroller.text;
    final String password = passwordCntroller.text;
    try{
      final UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
      await db.collection('users').doc(userCredential.user!.uid).set({
        name: name,
        email: email,
        password: password,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)
      ,
      );
    } on FirebaseAuthException catch(e) {
      if(nameCntroller.text.isEmpty && emailCntroller.text.isEmpty && passwordCntroller.text.isEmpty){
        showDialog(
            context: context,
            builder: (BuildContext context)  {
              return AlertDialog(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  title: 'Error',
                  txtSize: 25.0,
                  txtColor: Colors.white,
                ),
                content: TextWidget(
                  title: 'Please fill in all fields',
                  txtSize: 20.0,
                  txtColor: Colors.white,
                ),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  },
                    child: TextWidget(
                      title: 'OK',
                      txtSize: 18.0,
                      txtColor: Colors.blue,
                    ),
                  )
                ],
              );
        });
      }
      if(e.code == 'weak password'){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: TextWidget(
                title: ' Password provided is to Weak',
                txtColor: Theme.of(context).primaryColor,
                txtSize: 18.0,
            ),
            ),
        );
      }else if(e.code == 'email already in used'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: TextWidget(
              title: 'Email already exist',
              txtColor: Theme.of(context).primaryColor,
              txtSize: 18.0,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
        Divider(
        height: 50,
        ),
    Center(
    child: Container(
    height: MediaQuery.of(context).size.height / 3.5,
      child: Image(
        image: AssetImage('assets/notes.png'),
      ),
    ),
    ),
    SizedBox( height: 20,),
    Container(
    margin: EdgeInsets.only(left: 16.0,right: 21.0),
    height: MediaQuery.of(context).size.height / 1.67,
    width: MediaQuery.of(context).size.width ,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextWidget(title: "Sign Up", txtSize: 30, txtColor:Theme.of(context).primaryColor),
      TextWidget(title: "Name", txtSize: 22, txtColor:Color(0xffdddee3)),
      InputTxtField(hintText: "Your Name", controller: nameCntroller, obsecureText: false),
      TextWidget(title: "Email", txtSize: 22, txtColor:Color(0xffdddee3)),
      InputTxtField(hintText: "Your Email", controller: emailCntroller, obsecureText: false,),
      TextWidget(title: "Password", txtSize: 22, txtColor:Color(0xffdddee3)),
      InputTxtField(hintText: "Your Password", controller: passwordCntroller, obsecureText: true,),
    ],
    ),

    )
        ]
      ),
      )
    );
  }
}
*/
