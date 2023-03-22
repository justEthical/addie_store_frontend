import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/Widgets/top_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widgets/login_form.dart';
import 'Widgets/login_signup_switcher.dart';
import 'Widgets/signup_form.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  final LoginSignUpController c = Get.put(LoginSignUpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setFirstInstallFalse();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              SizedBox(height: Get.height * 0.05,),
              Obx(() => c.isLogin.value? LoginForm() : SignUpForm())
            ],
          ),
        ),
      )),
    );
  }

  _setFirstInstallFalse()async{
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("firstInstall", false);
  }
}
