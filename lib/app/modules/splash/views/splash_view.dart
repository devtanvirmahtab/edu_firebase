import 'package:edu_firebase/app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/style_constant.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            controller.splashTitle,
            style: subHeaderTextStyle(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
