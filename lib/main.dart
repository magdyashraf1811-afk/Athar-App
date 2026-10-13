import 'package:athaar_app/home/home_screen.dart';
import 'package:athaar_app/home/onboarding/onboarding_screen.dart';
import 'package:athaar_app/providers/app_theme_provider.dart';
import 'package:athaar_app/utils/app_routes.dart';
import 'package:athaar_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';
import 'providers/app_language_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider())
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteScreen,
      routes: {
        AppRoutes.onBoardingRouteScreen: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteScreen: (context) => const HomeScreen()},
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      locale: Locale(languageProvider.appLanguage),


    );
  }
}
