import 'package:athaar_app/home/home_screen.dart';
import 'package:athaar_app/home/onboarding/onboarding_screen.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteScreen,
      routes: {
        AppRoutes.onBoardingRouteScreen: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteScreen: (context) => const HomeScreen()},


    );
  }
}
