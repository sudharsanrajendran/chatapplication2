import 'package:flutter/material.dart';

import 'List_themes/AppBar_theme.dart';
import 'List_themes/Button_theme.dart';
import 'List_themes/TextTheme.dart';
import 'List_themes/Text_field.dart';

class Switch_theme {
  Switch_theme._();
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    appBarTheme: appbartheme.appbarlightmode,
    textTheme: Text_theme.textlighttheme,
    inputDecorationTheme: Textfieldtheme.lightinputdecoration,
    elevatedButtonTheme: Buttons.buttonLightMode,
  );
  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: Text_theme.textdarktheme,
    appBarTheme: appbartheme.appbardarkmode,
    inputDecorationTheme: Textfieldtheme.darkinputdecoration,
      elevatedButtonTheme: Buttons.buttonDarkMode
  );

}