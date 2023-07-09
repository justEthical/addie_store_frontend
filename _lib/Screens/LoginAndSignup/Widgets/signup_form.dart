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
import 'package:get/get_core/src/get_main.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final LoginSignUpController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: c.signUpFormKey,
        child: Column(
          children: [
            CustomTextField(
              textCtrl: c.registerEmail,
              hintText: "Email",
              leadingIcon: AppAssets.atIcon,
              title: "Email",
              isPassword: false,
              keyBoardType: TextInputType.emailAddress,
            ),
            _gap(),
            CustomTextField(
              textCtrl: c.registerPassword,
              hintText: "Password",
              leadingIcon: AppAssets.lockIcon,
              title: "Password",
              isPassword: true,
            ),
            CustomTextField(
              textCtrl: c.registerConfirmPassword,
              hintText: "Confirm Password",
              leadingIcon: AppAssets.lockIcon,
              title: "Confirm Password",
              isPassword: true,
            ),
            _gap(),
            CustomTextField(
              textCtrl: c.registerPhoneNo,
              hintText: "Phone number",
              leadingIcon: AppAssets.phoneIcon,
              title: "Phone number",
              isPassword: false,
              keyBoardType: TextInputType.phone,
            ),
            _gap(val: 20),
            SubmitButton(
                title: "Register",
                onTap: () async {
                  if (c.signUpFormKey.currentState!.validate()) {
                    CustomLoader.showLoader();
                    await AuthService.registerUser(
                        email: c.registerEmail.text.trim(),
                        password: c.registerPassword.text,
                        phone: c.registerPhoneNo.text);
                    CustomLoader.hideLoader();
                  }
                }),
            _gap(),
            const OrSeparator(),
            _gap(),
            const GoogleLoginButton(),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  _gap({double val = 10}) {
    return SizedBox(
      height: val,
    );
  }
}
