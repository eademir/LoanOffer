import 'package:flutter/material.dart';
import 'package:loan_offer/views/style/colour_palette.dart';

class CustomTheme {
  static final ColourPalette _palette = ColourPalette();

  ThemeData customThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
    scaffoldBackgroundColor: Colors.amberAccent,
    primaryColor: _palette.green,
    buttonTheme: const ButtonThemeData(
      height: 60,
      shape: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    ),
  );
}
