import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/custom_loader.dart';
import 'package:addie_store/Controllers/profile_tab_ctrl.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Screens/Profile/Widgets/logout_dialog.dart';
import 'package:addie_store/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

import 'Widgets/profile_option_tile.dart';
import 'Widgets/profile_picture.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TabViewController tvc = Get.find();
  final ProfileTabController c = Get.put(ProfileTabController());

  @override
  Widget build(BuildContext context) {
    var userProfile = tvc.userProfile.value!;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar.tabScreensAppBar(title: "Profile"),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfilePicture(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: Get.width - 30,
              height: 22,
              child: Center(
                  child: Text(
                FirebaseAuth.instance.currentUser!.displayName ?? "",
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ))),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: Get.width - 30,
              height: 22,
              child: Center(
                  child: Text(
                tvc.userProfile.value!.email!,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                    content: userProfile.phone_number!,
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
                      Get.defaultDialog(
                          titleStyle: const TextStyle(fontSize: 0),
                          content: const LogoutDialog());
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

// CustomLoader.showLoader();
//                       await AuthService.logout();
//                       CustomLoader.hideLoader();