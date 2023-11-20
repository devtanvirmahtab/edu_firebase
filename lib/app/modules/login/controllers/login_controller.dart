
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/firebase_constant.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginUser(String email,String password) async {
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        logger.w("login success");
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.snackbar("Error", "Please Enter all fields");
      }
    }on FirebaseException catch (e){
      logger.w("login Error ${e.toString()}");
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
