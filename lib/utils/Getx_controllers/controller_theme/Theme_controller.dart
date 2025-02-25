import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
class ThemeController extends GetxController{
  final storetheme= GetStorage();
  final Storage_key= 'isdarkmode';
  bool get isDarkMode => storetheme.read(Storage_key) ?? false;// write used to assign value and read used to check the values
  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;//default current theme check

  void switchTheme() {
    bool newTheme = !isDarkMode;
    storetheme.write(Storage_key, newTheme); // Save theme preference
    Get.changeThemeMode(newTheme ? ThemeMode.dark : ThemeMode.light);
    update();
  }


  //

}