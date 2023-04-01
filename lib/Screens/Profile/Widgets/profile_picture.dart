import 'package:addie_store/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ProfilePicture extends StatelessWidget {
  final Widget pic;
  const ProfilePicture({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {
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
            child: pic,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: (){},
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
                  color: Colors.orange, borderRadius: BorderRadius.circular(30)),
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
