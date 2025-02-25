import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  RxString imagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadImage(); // Load image from storage
  }

  void loadImage() {
    imagePath.value = box.read('profileImage') ?? ''; // Retrieve stored image
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      box.write('profileImage', pickedFile.path); // Save image path
    } else {
      print("No image selected");
    }
  }
}
