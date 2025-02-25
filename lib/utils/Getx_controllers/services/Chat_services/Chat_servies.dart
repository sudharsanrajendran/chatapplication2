import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatService extends GetxController{
  final FirebaseFirestore fireStore= FirebaseFirestore.instance;


Stream<List<Map<String,dynamic>>>getuserStream()
{
  return fireStore.collection("Users").snapshots().map((snapshot){
    return snapshot.docs.map((doc){
      final user= doc.data();
      return user;
    }).toList();
  });
}
}