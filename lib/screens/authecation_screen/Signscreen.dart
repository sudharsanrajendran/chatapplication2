import 'package:chatapplication/screens/authecation_screen/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../utils/Getx_controllers/controller_theme/Theme_controller.dart';
import '../../utils/Getx_controllers/services/authencation_service/firebase_auth.dart';
import '../../utils/Themes/glass_theme/container_glass_theme.dart';
import '../../utils/validators/Validation.dart';
import 'Widgets/custom_textfield.dart';
class Signscreen extends StatefulWidget {
  const Signscreen({super.key});

  @override
  State<Signscreen> createState() => _SignscreenState();
}

class _SignscreenState extends State<Signscreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController passowrd = TextEditingController();
    TextEditingController username= TextEditingController();
    final ThemeController themeController= Get.find();
    final Authencation authencation = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: Text('Sigin'),
          leading: ElevatedButton(
            onPressed: themeController.switchTheme,
            child: Text("Toggle Theme"),
          ),
        ),
        body:Column(
          children: [
            Spacer(),
            Container(
              child: Form(
                key:_formKey,
                child: Column(
                  children: [
                    CustomTextfield(controller: username,hintext: 'username',picon: Icon(Icons.person), label: 'username',validation: null,),
                    SizedBox(height: 20,),
                    CustomTextfield(controller: email,hintext: 'Email',picon: Icon(Icons.person), label: 'Email',validation: validator.validateEmail,),
                    SizedBox(height: 20,),
                    CustomTextfield(controller:passowrd,hintext: 'Password',picon: Icon(Icons.password), label: 'password',validation: validator.validatepassword,),
                    SizedBox(height: 20,),
                    GestureDetector(
                        onTap: (){
                          if (_formKey.currentState!.validate()) {
                            authencation.register(email.text,passowrd.text,username.text);
                          } else {
                            print("Validation Failed ❌");
                          }

                        },
                        child: Glass_Container(height: 100,width: 200,child: Center(child: Text(" Login",style: Theme.of(context).textTheme.titleSmall,)),color: Colors.blue,)),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
            Spacer()
          ],
        )
    );
  }
}
