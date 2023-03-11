import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUpSwitch extends StatefulWidget {
  const LoginSignUpSwitch({super.key});

  @override
  State<LoginSignUpSwitch> createState() => _LoginSignUpSwitchState();
}

class _LoginSignUpSwitchState extends State<LoginSignUpSwitch> {
  // var c.isLogin.value.value = true;
  double switchButtonWidth = (Get.width - 50) / 2;

  final LoginSignUpController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.all(5),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.withOpacity(0.2)),
        child: Stack(
          children: [
            SizedBox(
              height: 40,
              width: Get.width - 50,
            ),
            SizedBox(
              width: Get.width - 50,
              height: 40,
              child: Row(children: [
                _buttonBackgroundText("Login"),
                _buttonBackgroundText("Register"),
              ]),
            ),
            Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 40,
                  width: (Get.width - 50) / 2,
                  margin: EdgeInsets.only(
                      left: c.isLogin.value ? 0 : switchButtonWidth,
                      right: !c.isLogin.value ? 0 : switchButtonWidth),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Center(
                      child: Text(
                    c.switchButtonText.value,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.primaryText),
                  )),
                )),
          ],
        ));
  }

  Widget _buttonBackgroundText(String title) {
    return InkWell(
      onTap: () {
        c.isLogin.value = !c.isLogin.value;
        c.switchButtonText.value = c.isLogin.value ? "Login" : "Register";
        // setState(() {});
      },
      child: SizedBox(
        width: switchButtonWidth,
        height: 40,
        child: Center(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
