import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constant/app_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      var user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Navigate to home
        Navigator.pushReplacementNamed(context, AppConstant.homeView);
      } else {
        // Navigate to OnBoarding
        Navigator.pushReplacementNamed(context, AppConstant.loginView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:  Text('Splash',
              style: TextStyle(
                  fontSize: 62,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: AppConstant.cardTextColor)),
        ));
  }
}
