import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final onTap;
  const SubmitButton({super.key,this.title="Login", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width - 40, 55),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: ColorConstants.primaryText),
        child: Center(
            child: Text(
          title.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        )));
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: Size(Get.width - 40, 55),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(width: 0.56, color: Colors.black)),
            backgroundColor: Colors.white),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(AppAssets.googleIcon),
            ),
            const Text(
              "Login with Google",
              style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w600,
                  color: ColorConstants.primaryText),
            ),
          ],
        )));
    ;
  }
}
