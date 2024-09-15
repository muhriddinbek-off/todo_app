import 'package:flutter/material.dart';
import 'package:todo_app/screens/navigation/navigation_screens/home/home_screen.dart';
import 'package:todo_app/screens/navigation/navigation_bar_screen.dart';
import 'package:todo_app/screens/onboarding/onboarding_screen.dart';
import 'package:todo_app/screens/splash/splash_screen.dart';
import 'package:todo_app/screens/start/start_screen.dart';

class AppRoutes {
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRouteName.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case AppRouteName.start:
        return MaterialPageRoute(builder: (context) => const StartScreen());
      case AppRouteName.navigationScreen:
        return MaterialPageRoute(builder: (context) => const NavigationBarScreen());
      case AppRouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}

class AppRouteName {
  static const String splash = "/";
  static const String onboarding = "/onbarding";
  static const String start = "/start";
  static const String navigationScreen = "/navigator";
  static const String home = "/home";
}
