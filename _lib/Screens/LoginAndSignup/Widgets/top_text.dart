import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/fonts.dart';
import 'package:addie_store/Controllers/login_signup_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class TopText extends StatelessWidget {
  final String heading;
  final String subHeading;
  const TopText({super.key, required this.heading, required this.subHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: ColorConstants.primaryText),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subHeading,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.brown,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.shantell_sans),
        ),
      ],
    );
  }
}
