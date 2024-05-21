import 'package:flutter/material.dart';

class FAQScreens extends StatelessWidget {
  const FAQScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> faq = [
      "Learning Licence",
      "Driving Licence",
      "Registration of Vehicle",
      "Fitness of Vehicle",
      "Permit",
      "PUC",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "FAQ",
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
        itemCount: faq.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              selectedColor: Colors.blue,
              style: ListTileStyle.drawer,
              leading: const Icon(Icons.question_mark),
              title: Text(faq[index]),
            ),
          );
        },
      ),
    );
  }
}
