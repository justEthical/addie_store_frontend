import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  final String img;
  final String title;
  final String content;
  const IntroScreen(
      {Key? key, required this.img, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 6,
            child: SvgPicture.asset(img)),
          const Spacer(flex: 1,),
          Flexible(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: ColorConstants.primaryText),
            ),
          ),
          const SizedBox(height: 20,),
          Flexible(
            flex: 1,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: AppFonts.shantell_sans,
                color: Colors.brown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
