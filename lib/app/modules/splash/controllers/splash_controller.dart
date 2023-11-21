import 'package:edu_firebase/app/core/constants/firebase_constant.dart';
import 'package:edu_firebase/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late Rx<User?> _user;
  final splashTitle = "Edu Fire";

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 3000),(){
      _user = Rx<User?>(firebaseAuth.currentUser);
      _user.bindStream(firebaseAuth.authStateChanges());
      ever(_user, _setInitialScreen);
    });
  }

  _setInitialScreen(User? user){
    if(user == null){
      Get.offAllNamed(Routes.LOGIN);
    }else{
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
