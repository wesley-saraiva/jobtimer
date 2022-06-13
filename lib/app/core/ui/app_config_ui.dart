// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();

  static const MaterialColor _primarySwatch = MaterialColor(0XFF006680, {
    50: Color(0XFF005c73),
    10: Color(0XFF005266),
    200: Color(0XFF00475a),
    300: Color(0XFF003d4d),
    400: Color(0XFF003340),
    500: Color(0XFF002933),
    600: Color(0XFF001f26),
    700: Color(0XFF00141a),
    800: Color(0XFF000a0d),
    900: Color(0XFF000000),
  });

  static final ThemeData themeData = ThemeData(
    primarySwatch: _primarySwatch,
    primaryColor: const Color(0XFF006680),
    primaryColorLight: const Color(0XFF219FFF),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
