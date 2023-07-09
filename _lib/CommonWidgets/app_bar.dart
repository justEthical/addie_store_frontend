import 'package:addie_store/CommonWidgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../Constants/color_constants.dart';

class CommonAppBar{
  static tabScreensAppBar({required String title}){
    return AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          NotificationIcon()
        ],
      );
  }

  static appBarWithLocation(){
    return AppBar(
        leading: InkWell(
          onTap: () {},
          child: Container(
            width: 40,
            height: 30,
            child: const Icon(FeatherIcons.alignLeft),
          ),
        ),
        title: Column(
          children: [
            const Text(
              "Current location",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  FeatherIcons.mapPin,
                  color: ColorConstants.primaryText,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Delhi India"),
              ],
            )
          ],
        ),
        actions: const [NotificationIcon()],
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
  }
}