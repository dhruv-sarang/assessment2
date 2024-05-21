import 'package:flutter/material.dart';
import 'package:rto_assessment2/screens/home/hom_page.dart';
import 'package:rto_assessment2/screens/login/login_screen.dart';
import '../constant/app_constant.dart';
import '../screens/splash/splash_view.dart';


class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstant.splashView:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );

      case AppConstant.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case AppConstant.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
