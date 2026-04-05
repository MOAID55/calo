import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      surface: Colors.white,
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: .bold,
      ),
      titleSmall: TextStyle(fontSize: 14, fontWeight: .bold),
      titleMedium: TextStyle(fontSize: 20, fontWeight: .bold),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
