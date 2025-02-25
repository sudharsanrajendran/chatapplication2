import 'package:flutter/material.dart';

class appbartheme{
  appbartheme._();
  static AppBarTheme appbarlightmode= AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.black,
      iconTheme: IconThemeData(color:Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(fontSize: 18.0)
  );
  static AppBarTheme appbardarkmode= AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.black,
      iconTheme: IconThemeData(color:Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(fontSize: 18.0)
  );



}