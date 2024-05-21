import 'package:flutter/material.dart';

class ProcessScreens extends StatelessWidget {
  const ProcessScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> process = [
      "New Driving License",
      "Additional of another category in the existing driving license",
      "Renewal of Driving License",
      "For change in details of driving license or obtaining a duplicate",
      "International Driving License or Permit",
      "Driving License delivered",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "Process of Driving Licence",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white,fontWeight: FontWeight.w800,letterSpacing: 1),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,size: 26,color: Colors.white,),
        ),
      ),
      body: ListView.builder(
        itemCount: process.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              selectedColor: Colors.blue,
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.wifi_protected_setup_outlined),
              title: Text(process[index]),
            ),
          );
        },
      ),
    );
  }
}
