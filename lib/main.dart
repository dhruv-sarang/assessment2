import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rto_assessment2/routing/app_route.dart';

import 'constant/app_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB0UnuRuN8OX5dTy7gCgZHtFEl3Ng06gaI",
          appId: "1:201640849950:android:ff0c2e71a5926b025b340f",
          messagingSenderId: "201640849950",
          projectId: "rto-android",
          storageBucket: "rto-android.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppConstant.splashView,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:rto_assessment2/screens/home/hom_page.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }
