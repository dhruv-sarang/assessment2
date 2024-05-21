import 'package:flutter/material.dart';

class MarkedForRevision extends StatefulWidget {
  const MarkedForRevision({super.key});

  @override
  State<MarkedForRevision> createState() => _MarkedForRevisionState();
}

class _MarkedForRevisionState extends State<MarkedForRevision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Marked For Revision",
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
