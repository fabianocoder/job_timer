import 'package:flutter/material.dart';

class AppConfigUi {
  AppConfigUi._();

  static const MaterialColor _primarySwatch = MaterialColor(
    0XFF006680,
    {
      50: Color(0XFF223310),
      100: Color(0XFF223310),
      200: Color(0XFF223310),
      300: Color(0XFF223310),
      400: Color(0XFF223310),
      500: Color(0XFF223310),
      600: Color(0XFF223310),
      700: Color(0XFF223310),
      800: Color(0XFF223310),
    },
  );

  static final ThemeData theme = ThemeData(
      primarySwatch: _primarySwatch,
      primaryColor: const Color(0xFF0066B0),
      primaryColorLight: const Color(0xFF219FFF),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
        10,
      )))));
}
