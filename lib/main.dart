import 'package:flutter/material.dart';
import 'package:islamic_appv2/app_theme.dart';
import 'package:islamic_appv2/main_screen.dart';
import 'package:islamic_appv2/tabs/quran/sura_details_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MainScreen.route: (context) => MainScreen(),
        SuraDetailsScreen.route: (context) => SuraDetailsScreen(),
      },
      initialRoute: MainScreen.route,
      theme: AppTheme.lightTheme,
    );
  }
}
