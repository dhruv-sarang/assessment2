import 'package:flutter/material.dart';

import '../add_question/add_question.dart';
import '../faq/faq_screen.dart';
import '../form/form_screen.dart';
import '../marke_for_revision/marke_for_revision_screen.dart';
import '../moke/moke_test.dart';
import '../learn/learn_screen.dart';
import '../practice/practice_screen.dart';
import '../process/process_screen.dart';
import '../rto_office/rto_office_screen.dart';
import '../statistics/statistics_screen.dart';

class RTO {
  IconData icon;
  String description;
  Function onTap;

  RTO({required this.icon, required this.description, required this.onTap});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RTO> rto = [
    RTO(
        icon: Icons.menu_book_rounded,
        description: "Learn",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LearnScreen()));
        }),
    // RTO(
    //     icon: Icons.book,
    //     description: "Practice",
    //     onTap: (context) {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => const PracticeScreen()));
    //     }),
    RTO(
        icon: Icons.computer,
        description: "Moke Test",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MokeTestScreens()));
        }),
    RTO(
        icon: Icons.computer,
        description: "Marked for\n Revision",
        onTap: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MarkedForRevision()));
        }),
    RTO(
        icon: Icons.home_work_outlined,
        description: "RTO Office",
        onTap: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RTOOfficeScreens()));
        }),
    RTO(
        icon: Icons.screen_rotation_alt,
        description: "Process",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProcessScreens()));
        }),
    RTO(
        icon: Icons.stacked_bar_chart,
        description: "Statistics",
        onTap: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const StatisticsScreens()));
        }),
    RTO(
        icon: Icons.book,
        description: "Forms",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
        }),
    RTO(
        icon: Icons.quora,
        description: "FAQ",
        onTap: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FAQScreens()));
        }),
    RTO(
        icon: Icons.add,
        description: "Add\nQuestion",
        onTap: (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddQuestion()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF124DAC),
        title: Text(
          "RTO Driving License",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.dehaze,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            childAspectRatio: 1,
            crossAxisSpacing: 1, // Horizontal spacing between items
            mainAxisSpacing: 1, // Vertical spacing between items
          ),

          itemCount: rto.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        rto[index].icon,
                        size: 50,
                      ),
                      Expanded(
                        child: Text(
                          rto[index].description,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                // print('name : ${FirebaseAuth.instance.currentUser!.email}');
                rto[index]
                    .onTap(context); // Invoke the onTap function with context
              },
            );
          }),
    );
  }
}
