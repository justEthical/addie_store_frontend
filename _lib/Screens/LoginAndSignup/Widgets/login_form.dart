import 'package:addie_store/CommonWidgets/custom_loader.dart';
import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/Or_separator.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/custom_text_field.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/login_button.dart';
import 'package:addie_store/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final LoginSignUpController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: c.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              textCtrl: c.loginEmail,
              hintText: "Enter Email...",
              leadingIcon: AppAssets.atIcon,
              title: "Email",
              isPassword: false,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              textCtrl: c.loginPassword,
              hintText: "Enter password...",
              leadingIcon: AppAssets.lockIcon,
              title: "Password",
              isPassword: true,
            ),
            const SizedBox(
              height: 40,
            ),
            SubmitButton(
              onTap: () async {
                if (c.loginFormKey.currentState!.validate()) {
                  CustomLoader.showLoader();
                  await AuthService.emailLogin(
                      email: c.loginEmail.text.trim(),
                      password: c.loginPassword.text);
                  CustomLoader.hideLoader();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const OrSeparator(),
            const SizedBox(
              height: 20,
            ),
            const GoogleLoginButton()
          ],
        ));
  }
}
