
import 'package:chatapplication/utils/Getx_controllers/services/Database_servies/Databaservie.dart';
import 'package:flutter/material.dart';

import '../../utils/Getx_controllers/services/Database_servies/jsons/Chat_user.dart';
import 'Widgets/CharUserCard.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).appBarTheme.foregroundColor,
        automaticallyImplyLeading: false,
        actions:[
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('home',style: Theme.of(context).textTheme.headlineSmall?.copyWith()),
    ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(0),
            child: IconButton(onPressed: (){}, icon:Icon(Icons.search)),
          ),

          IconButton(onPressed: (){}, icon:Icon(Icons.menu)),
        ]
        
      ),
      body: StreamBuilder(stream: Userdatabase.firestore.collection('Users').snapshots(), builder: (context,snapshot){
     switch(snapshot.connectionState){
       case ConnectionState.waiting:

       case ConnectionState.none:
         return const Center(child:CircularProgressIndicator(),);
       case ConnectionState.active:
       case ConnectionState.done:
     final data= snapshot.data?.docs;
     final list = data?.map((e)=>ChatUser.fromJson(e.data())).toList()??[];
      return ListView.builder(itemCount:list.length,padding:EdgeInsets.all(6),itemBuilder: (context,index){
        return Chatusercard(user:list[index]);
      });
      }}),
    );
  }
}


