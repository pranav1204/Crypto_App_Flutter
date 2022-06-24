import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_app_flutter/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../pages/adminscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'user';
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
    _checkUserdata();
    _checkRole();
  }

  Future<StatefulWidget> _checkUserdata() async{
    if (_auth.currentUser != null) {
      return SplashScreen();
    } else {
      return LoginScreen();
    }
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();

    setState(() {
      role = snap['role'];
    });

    if(role == 'user'){
      navigateNext(AppScreen());
    } else if(role == 'admin'){
      navigateNext(AdminScreen());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(splash: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset('assets/sobGOGlight.png'),
      ), nextScreen: AppScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
        duration: 3000,
      ),
    );
  }
}