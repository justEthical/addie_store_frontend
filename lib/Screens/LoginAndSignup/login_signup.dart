import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/fonts.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/top_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'Widgets/login_form.dart';
import 'Widgets/login_signup_switcher.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  final LoginSignUpController c = Get.put(LoginSignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => c.isLogin.value
                ? const TopText(
                    heading: "Welcome Back",
                    subHeading: "Glad to see you again")
                : const TopText(
                    heading: "Let's Start",
                    subHeading: "Create your account in simple steps",
                  )),
            const SizedBox(
              height: 20,
            ),
            const LoginSignUpSwitch(),
            const SizedBox(height: 50,),
             LoginForm()
          ],
        ),
      )),
    );
  }
}
