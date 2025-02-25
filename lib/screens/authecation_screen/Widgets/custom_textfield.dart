import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, this.controller, required this.picon, required this.hintext, required this.label, this.validation});
final controller;
final Icon picon;
final String hintext;
final String label;
final validation;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      decoration: InputDecoration(prefixIcon: picon,hintText: hintext,labelText: label,)
      );
  }
}
