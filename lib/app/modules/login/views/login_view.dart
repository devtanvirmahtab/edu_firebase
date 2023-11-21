import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_constant.dart';
import '../../../core/constants/color_constants.dart';
import '../../../core/constants/style_constant.dart';
import '../../../core/widgets/text_input_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tiktok Clone",
              style: headerTextStyle(),
            ),
            appHeight(),
            Text(
              "Login",
              style: subHeaderTextStyle(),
            ),
            appHeight(scale: 0.5),
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
                onTap: () => controller.loginUser(
                  controller.emailController.text,
                  controller.passwordController.text,
                ),
                child: Center(
                  child: controller.isLoading.value ? const CircularProgressIndicator(color: Colors.white,) : Text(
                    "Login",
                    style:
                    subHeaderTextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ),
            appHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: normalTextStyle(
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Register",
                    style: normalTextStyle(color: buttonColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
