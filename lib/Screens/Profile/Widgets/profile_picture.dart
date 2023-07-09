import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Models/user_profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfilePicture extends StatefulWidget {
  // final Widget pic;
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final TabViewController tvc = Get.find();

  @override
  Widget build(BuildContext context) {
    var pic = RandomAvatar(tvc.userProfile!.email!,
        width: 150, height: 150, trBackground: false);
    return Stack(
      children: [
        Container(
          height: 150,
          width: 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(150),
              border: Border.all(width: 4, color: ColorConstants.primaryText)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: tvc.userProfile!.profile_pic != ""
                ? CachedNetworkImage(
                    width: 150,
                    height: 150,
                    imageUrl: tvc.userProfile!.profile_pic!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : pic,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.white),
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Icon(
                FeatherIcons.edit2,
                color: Colors.white,
                size: 16,
              )),
            ),
          ),
        )
      ],
    );
  }
}
