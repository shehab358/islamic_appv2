import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimary = const Color(0xffB7935F);
  static Color dartPrimary = const Color(0xff141A2E);
  static Color white = const Color(0xfff8f8f8);
  static Color gold = const Color(0xffFACC1D);
  static Color black = const Color(0xff242424);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black,
        backgroundColor: Colors.transparent,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightPrimary,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
      displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(lightPrimary), // Corrected `WidgetStateProperty` to `MaterialStateProperty`
        minimumSize: WidgetStateProperty.all<Size>(const Size(150, 50)),
      ),
    ),
  ); 

  static ThemeData darkTheme = ThemeData();
}
