import 'dart:io';
import 'package:chatapplication/utils/Getx_controllers/services/Database_servies/jsons/Chat_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser userdetails;
  const ProfileScreen({super.key, required this.userdetails});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;
  bool isLoading = false;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery, // Change to ImageSource.camera for camera
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });

      _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      Reference storageRef =
      FirebaseStorage.instance.ref().child('$userId.jpg');

      UploadTask uploadTask = storageRef.putFile(_image!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print("File path: ${storageRef.fullPath}");

      await FirebaseFirestore.instance.collection('Users').doc(userId).update({
        'image': downloadUrl,
      });

      setState(() {
        widget.userdetails.image = downloadUrl;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile picture updated successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading image: $e")),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: _image != null
                      ? FileImage(_image!) as ImageProvider
                      : NetworkImage(widget.userdetails.image),
                  radius: 50,
                ),
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: _pickImage,
                    icon: Icon(Icons.add_a_photo, size: 30),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              widget.userdetails.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("About: ${widget.userdetails.about}"),
            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
