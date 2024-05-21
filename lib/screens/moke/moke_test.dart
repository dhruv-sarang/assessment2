import 'package:flutter/material.dart';
import 'package:rto_assessment2/screens/moke/start_test.dart';

import '../../firebase/firebase_service.dart';
import '../../model/question.dart';

class MokeTestScreens extends StatefulWidget {
  const MokeTestScreens({super.key});

  @override
  State<MokeTestScreens> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<MokeTestScreens> {

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width * 0.9;
    double hSize = 50;
    double gap = 12;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Moke Test",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: 1),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Introduction",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Divider(thickness: 3),
                ),
                const Text(
                  "Subject like Rules and Regulations of traffic, and traffic signage's included in the test.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: gap,
                ),
                const Text(
                  "15 questions are asked in the test at random, out of which 11 questions are required to be answered correctly to pass the test.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(
                  height: gap,
                ),
                const Text(
                  "48 seconds are allowed to answer each question.",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(wSize, hSize),
                    backgroundColor: Colors.yellowAccent,
                    elevation: 3,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartTest()));
                  },
                  child: const Text(
                    "Start Test",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
