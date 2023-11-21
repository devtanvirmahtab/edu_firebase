import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/style_constant.dart';
import '../../../core/util/helpers.dart';
import '../../../core/widgets/text_input_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: subHeaderTextStyle(),
                  ),
                  appHeight(scale: 0.5),
                  Stack(
                    children: [
                      Obx(() {
                        return CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              getProfileImage(controller.imagePath.value, ""),
                        );
                      }),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                            onTap: () {
                              controller.pickImage();
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              padding: mainPaddingAll(scale: 0.3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: whiteColor,
                              ),
                              child: const Icon(
                                size: 20,
                                Icons.camera_alt,
                                color: grayColor,
                              ),
                            )),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: mainPaddingAll(scale: 0.5),
                    child: TextInputField(
                      inputController: controller.userNameController,
                      labelText: "Enter Name",
                      icon: Icons.person,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: mainPaddingAll(scale: 0.5),
                    child: TextInputField(
                      inputController: controller.emailController,
                      labelText: "Enter Email",
                      icon: Icons.email_rounded,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: mainPaddingAll(scale: 0.5),
                    child: TextInputField(
                      inputController: controller.passwordController,
                      labelText: "Enter Password",
                      icon: Icons.lock,
                      isObscure: true,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: mainPaddingAll(scale: 0.5),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.registerUser(
                          controller.userNameController.text,
                          controller.emailController.text,
                          controller.passwordController.text,
                          File(controller.imagePath.value),
                        );
                      },
                      child: Center(
                        child: Obx(() {
                          return controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Register",
                                  style: subHeaderTextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                );
                        }),
                      ),
                    ),
                  ),
                  appHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: normalTextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Text(
                          "Login",
                          style: normalTextStyle(color: buttonColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
