import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/custom_loader.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

import 'Widgets/profile_option_tile.dart';
import 'Widgets/profile_picture.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget? k;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    k = RandomAvatar("Ashoka", width: 150, height: 150, trBackground: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar.tabScreensAppBar(title: "Profile"),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePicture(
            pic: k!,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: Get.width - 30,
              height: 22,
              child: const Center(
                  child: Text(
                "Ashok Kumar",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: Get.width - 30,
              height: 22,
              child: const Center(
                  child: Text(
                "ammmm4507@gmail.com",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ))),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              child: Column(
                children: [
                  ProfileOptionTile(
                    onTap: () {},
                    icon: FeatherIcons.phone,
                    heading: "Phone",
                    content: "9650139032",
                  ),
                  ProfileOptionTile(
                      onTap: () {},
                      heading: "Address",
                      content: "Your addresses and location",
                      icon: FeatherIcons.mapPin),
                  ProfileOptionTile(
                      onTap: () {},
                      heading: "Help",
                      content: "About Us & FAQs",
                      icon: FeatherIcons.helpCircle),
                  ProfileOptionTile(
                      onTap: () {},
                      heading: "History",
                      content: "Your orders",
                      icon: FeatherIcons.shoppingCart),
                  ProfileOptionTile(
                      onTap: () {},
                      heading: "Refer & Earn",
                      content: "Refer friends and earn Rs 10",
                      icon: FeatherIcons.gift),
                  ProfileOptionTile(
                    onTap: () async {
                      CustomLoader.showLoader();
                      await AuthService.logout();
                      CustomLoader.hideLoader();
                    },
                    icon: FeatherIcons.logOut,
                    content: "Logout",
                  ),
                ],
              ))
        ],
      )),
    );
  }
}
