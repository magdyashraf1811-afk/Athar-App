import 'package:athaar_app/home/home_screen.dart';
import 'package:athaar_app/home/onboarding/onboarding_screen.dart';
import 'package:athaar_app/providers/app_theme_provider.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:athaar_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      child: MyApp(), create: (context) => AppThemeProvider()));
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
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,


    );
  }
}
