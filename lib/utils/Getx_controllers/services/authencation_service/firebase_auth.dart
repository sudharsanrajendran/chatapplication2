import 'dart:io';

import 'package:chatapplication/screens/Home_screen/Home.dart';
import 'package:chatapplication/screens/authecation_screen/Loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Database_servies/Databaservie.dart';

class Authencation extends GetxController {


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<UserCredential?> register(String email, String password, username) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      firestore.collection("Users").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
        "username": username, // Store username separately
      });

      Get.snackbar("SUCCESS", "Registered successfully");
      Get.to(Loginscreen());

      print("User Registered Successfully");
      return userCredential;
    } catch (e) {
      Get.snackbar("Invalid", "Register failed");
      print("Sign-up Error: $e");
      return null;
    }
  }



  Future<UserCredential?> Login(String email, String password,) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,

      );

      firestore.collection("Users").doc(userCredential.user!.uid).set({
        "email": email,
        "uid": userCredential.user!.uid,
      });

      Get.snackbar("SUCCESS", "Login successfully");


      print("User login Successfully");
      return userCredential;
    } catch (e) {
      Get.snackbar("Invalid", "Login failed");
      print("login Error: $e");
      return null;
    }
  }



   handlegooglefunction(){
    _signInWithGoogle().then((user) async {
      if(user!=null) {
        print('user info:${user}\n');
        print('user additionInfo:${user.additionalUserInfo}');
if( (await Userdatabase.userExists())){
  print("user already exits da");
  Get.to(HomeScreen());
}
else{
  print("new va vanthurukan da eve");
  await Userdatabase.Createuser().then((value){
    Get.to(HomeScreen());
  });
}
      }
      else{
        print("user is null");
      }

    });
  }


  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final  credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print('google sigin successfull');
      return await FirebaseAuth.instance.signInWithCredential(credential);


    } catch (e) {
      print("Error signing in with Google: $e");
      Get.snackbar("Google SigIn Error", "check internet or Google account");
    }
  }

  signout()async{

    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    print("Sign out");
  }



}
