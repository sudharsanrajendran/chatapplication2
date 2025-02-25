
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/Getx_controllers/controller_theme/Theme_controller.dart';
import '../../utils/Getx_controllers/services/authencation_service/firebase_auth.dart';
import '../../utils/Themes/glass_theme/container_glass_theme.dart';
import '../../utils/validators/Validation.dart';
import '../Home_screen/Home.dart';
import 'Signscreen.dart';
import 'Widgets/custom_textfield.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ThemeController themeController= Get.find();
    final Authencation authencation = Get.find<Authencation>();
    TextEditingController email = TextEditingController();
    TextEditingController passowrd = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        leading: ElevatedButton(
          onPressed: themeController.switchTheme,
          child: Text("Toggle Theme"),
        ),
      ),
      body:Column(
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextfield(
                    validation:  validator.validateEmail,

                    controller: email,hintext: 'username',picon: Icon(Icons.person), label: 'username',),
                  SizedBox(height: 20,),
                  CustomTextfield(
                    validation:  validator.validatepassword,
                    controller: passowrd,hintext: 'Password',picon: Icon(Icons.password), label: 'password',),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      if (_formKey.currentState!.validate()) {
                        authencation.Login(email.text, passowrd.text,);
                      } else {
                        print("Validation Failed ❌");
                      }

                    },
                      child: Glass_Container(height: 100,width: 200,child: Center(child: Text(" Login",style: Theme.of(context).textTheme.titleSmall,)),color: Colors.blue,)),
                  SizedBox(height: 20,),
                  GestureDetector(
                      onTap: (){
                        Get.to(Signscreen());
                      },
                      child: Glass_Container(height: 100,width: 200,child: Center(child: Text(" Sigin",style: Theme.of(context).textTheme.titleSmall,)),color: Colors.blue,)),

                  GestureDetector(
                      onTap: (){
                        authencation.handlegooglefunction();
                      },
                      child: Glass_Container(height: 100,width: 200,child: Center(child: Text(" Google signin",style: Theme.of(context).textTheme.titleSmall,)),color: Colors.blue,)),
                  GestureDetector(
                      onTap: (){
                        authencation.signout();
                      },
                      child: Glass_Container(height: 100,width: 200,child: Center(child: Text(" signout",style: Theme.of(context).textTheme.titleSmall,)),color: Colors.blue,)),

                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
