import 'package:flutter/material.dart';

class ThemeConfigration{

  // this class to handle if there are multi themes dark and light
  // i added only light configration :)
  // based on ui ux the theme data should be filled with other properties..
  static getTheme()=>ThemeData(
    searchBarTheme: SearchBarThemeData(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
    ),
  );
}