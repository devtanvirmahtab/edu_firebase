import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/firebase_constant.dart';
import '../../../data/models/user_model.dart';

class SignupController extends GetxController {
  final imagePath = "".obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  //pick image;
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      Get.snackbar("Success", "Picked image Success");
      imagePath.value = pickedImage.path;
      logger.d("$pickedImage");
      logger.d("image Path ${imagePath.value}");
    }
  }

  //upload image to firebase storage
  Future<String> _uploadImageToFirebaseStorage(File image) async {
    final extension = image.path.split('.').last;
    final ref = firebaseStorage.ref();
    final mountainsRef = ref.child("profilePics/${firebaseAuth.currentUser!.uid}.$extension");

    UploadTask uploadTask = mountainsRef.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //register the user
  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        //save your to fireStore
        UserCredential credential =  await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        String downloadUrl = await _uploadImageToFirebaseStorage(image);
        logger.w("image upload to firestore $downloadUrl");
        UserModel user = UserModel(
          name: username,
          email: email,
          profilePhoto: downloadUrl,
          uid: credential.user!.uid,
        );
        await fireStore.collection("users").doc(credential.user!.uid).set(user.toJson());
        Get.snackbar("Success", "Account created Successfully ");
      }else{
        Get.snackbar("Error", "Please Enter All The Field");
      }
    } catch (e) {
      Get.snackbar("Error Creating Account", e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
