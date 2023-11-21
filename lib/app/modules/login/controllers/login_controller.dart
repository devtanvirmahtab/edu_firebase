
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/firebase_constant.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loginUser(String email,String password) async {
    try{
      isLoading.value = true;
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password,);
        logger.w("login success");
        Get.offAllNamed(Routes.HOME);
      }else{
        Get.snackbar("Error", "Please Enter all fields");
      }
      isLoading.value = false;
    }on FirebaseException catch (e){
      isLoading.value = false;
      logger.w("login Error ${e.toString()}");
      Get.snackbar("Error", e.toString());
    }
  }


  @override
  void onClose() {
    super.onClose();
  }

}
