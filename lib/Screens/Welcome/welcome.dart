import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/string_constants.dart';
import 'package:addie_store/Controllers/welcome_ctrl.dart';
import 'package:addie_store/Screens/LoginAndSignup/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'Widgets/sub_screen.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key? key}) : super(key: key);

  @override
  State<WelcomeScreens> createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final c = Get.put(WelcomeScreenController());
  @override
  Widget build(BuildContext context) {
    var s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 8,
              child: PageView(
                controller: c.welcomePageCtrl,
                children: [
                  IntroScreen(
                    img: AppAssets.welcome1,
                    title: "Best Prices & Deals",
                    content: Strings.welcome1,
                  ),
                  IntroScreen(
                    img: AppAssets.welcome2,
                    title: "Track your Orders",
                    content: Strings.welcome2,
                  ),
                  IntroScreen(
                    img: AppAssets.welcome3,
                    title: "Free and Fast Delivery",
                    content: Strings.welcome3,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: FloatingActionButton(
                onPressed: () {
                  if (c.welcomePageCtrl.page == 2.0) {
                    Get.offAll(const LoginSignUp());
                  } else {
                    c.welcomePageCtrl.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  }
                },
                backgroundColor: Colors.white,
                child: const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.brown,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
