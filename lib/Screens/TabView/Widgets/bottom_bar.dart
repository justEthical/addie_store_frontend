import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabViewController c = Get.find();
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 2,
                spreadRadius: 2,
                color: Colors.black12)
          ]),
      child: Obx(() => SalomonBottomBar(
            currentIndex: c.currentTabIndex.value,
            onTap: (i) {
              c.currentTabIndex.value = i;
              c.tabViewController.animateTo(Get.width * i,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn);
            },
            items: [
              _bottomButton(title: "Home", icon: AppAssets.home),

              /// Likes
              _bottomButton(title: "Food", icon: AppAssets.food),

              /// Search
              _bottomButton(title: "Grocery", icon: AppAssets.grocery),

              /// Profile
              _bottomButton(title: "Profile", icon: AppAssets.profile),
            ],
          )),
    );
  }

  _bottomButton({required String title, required String icon}) {
    return SalomonBottomBarItem(
      icon: SizedBox(
        width: 20,
        height: 20,
        child: SvgPicture.asset(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(title),
      selectedColor: ColorConstants.primaryText,
    );
  }
}
