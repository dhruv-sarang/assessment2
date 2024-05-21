import 'package:flutter/material.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [


            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: ColorFiltered(
            //     colorFilter: ColorFilter.mode(
            //       Colors.white.withOpacity(0.4),
            //       BlendMode.srcOver,
            //     ),
            //     child: Image.asset(
            //       'assets/images/login_bg.png',
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),



            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Image.asset(
            //     'assets/images/login_bg.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: LoginForm(),
            )
          ],
        ),
      ),
    );
  }
}
