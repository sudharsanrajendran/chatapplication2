import 'package:chatapplication/screens/prodfile_screen/profile_screen.dart';
import 'package:chatapplication/utils/Getx_controllers/services/Database_servies/jsons/Chat_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Chatusercard extends StatefulWidget {
  final ChatUser user;
  const Chatusercard({super.key, required this.user});

  @override
  State<Chatusercard> createState() => _ChatusercardState();
}

class _ChatusercardState extends State<Chatusercard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(),
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(widget.user.name),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.image),
                          radius: 40,
                        ),
                        SizedBox(height: 10),
                        Text("Last Active: ${widget.user.lastActive}"),
                      ],
                    ),
                    actions: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(ProfileScreen(userdetails: widget.user,));
                  },
                            child: Text("view"),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Close"),
                          ),
                        ],
                      )],
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.image),
            ),
          ),
          title: Text(widget.user.name),
          trailing: Text(widget.user.lastActive),
        ),
      ),
    );
  }
}
