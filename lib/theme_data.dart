import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: elevatedButtonTheme,
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.green.shade800,
  foregroundColor: Colors.white,
  titleTextStyle: TextStyle(
    color: Colors.white,
    fontSize: 23,
    fontWeight: FontWeight.w600,
  ),
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green.shade800,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.green,
  brightness: Brightness.dark,
);
