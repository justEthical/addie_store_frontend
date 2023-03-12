import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/custom_text_field.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/login_button.dart';
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
        const LoginButton(),
        const SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
        GoogleLoginButton()
      ],
    ));
  }
}
