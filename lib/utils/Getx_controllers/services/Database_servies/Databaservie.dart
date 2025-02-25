import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'jsons/Chat_user.dart';

class Userdatabase extends GetxController{
  
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
   static User get user =>auth.currentUser!;
  //check user inside or not
   static Future<bool>userExists()async{
     return (await firestore.collection('Users').doc(user.uid).get()).exists;
   }

   static Future<void>Createuser()async{
     final time=DateTime.now().millisecondsSinceEpoch.toString();
     final chatUser=ChatUser(
       id:user.uid,
       name:user.displayName.toString(),
       email:user.email.toString(),
       about:"Hey, I am useing chatiee",
       image:user.photoURL.toString(),
       createdAt:time,
       isOnline:false,
       lastActive:time,
       pushToken:'',

     );
     return await firestore.
     collection('Users').
     doc(user.uid).
     set(chatUser.toJson());
   }


}