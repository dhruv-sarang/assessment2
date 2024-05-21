import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: RichText(
          text: TextSpan(
            text: 'Practice Test\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1),
            // style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: '${FirebaseAuth.instance.currentUser!.email}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.yellow,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
