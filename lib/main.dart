import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/screens/splash.dart';
import 'dart:async';
import 'dart:js';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),

    );
  }
}
