import 'package:chatapplication/screens/Home_screen/Home.dart';
import 'package:chatapplication/screens/authecation_screen/Loginscreen.dart';
import 'package:chatapplication/utils/Getx_controllers/controller_theme/Theme_controller.dart';
import 'package:chatapplication/utils/Getx_controllers/services/authencation_service/firebase_auth.dart';
import 'package:chatapplication/utils/Themes/Switch_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  await GetStorage.init();
  Get.put(Authencation());// Initialize GetStorage
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'GetX Theme Manager',
      debugShowCheckedModeBanner: false,
      theme: Switch_theme.lighttheme,
      darkTheme: Switch_theme.darktheme,
      themeMode: themeController.theme, // Apply saved theme
      home: Loginscreen(),
    );
  }
}