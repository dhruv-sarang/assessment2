import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Form Screen",
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
    );
  }
}
