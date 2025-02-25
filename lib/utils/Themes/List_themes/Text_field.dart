import 'package:flutter/material.dart';

class Textfieldtheme{
  Textfieldtheme._();
  static  InputDecorationTheme lightinputdecoration = InputDecorationTheme(

      errorMaxLines: 3,
      prefixIconColor: Colors.black87,
      suffixIconColor: Colors.black87,
      fillColor: Colors.grey.shade200,
      labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
      hintStyle:  const TextStyle().copyWith(fontSize: 14,color: Colors.black),
      errorStyle:  const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle:  const TextStyle().copyWith(fontSize: 14,color: Colors.black.withOpacity(0.5)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey, width: 1),
      )  ,
      //enabledborder
      enabledBorder:   const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
      //error border
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      //focusedorder
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.green, width: 1),
      ),
      //focusederrorborder
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.red, width: 1),
      )


  );
  static  InputDecorationTheme darkinputdecoration = InputDecorationTheme(

      errorMaxLines: 3,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
      hintStyle:  const TextStyle().copyWith(fontSize: 14,color: Colors.white),
      errorStyle:  const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle:  const TextStyle().copyWith(fontSize: 14,color: Colors.white.withOpacity(0.5)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey, width: 1),

      )  ,
      enabledBorder:   const OutlineInputBorder().copyWith(

        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      errorBorder: const OutlineInputBorder().copyWith(

        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.red, width: 1),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(

        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.green, width: 1),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(

        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.red, width: 1),
      )


  );

}