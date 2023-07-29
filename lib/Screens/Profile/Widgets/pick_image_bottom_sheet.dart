import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/fonts.dart';
import 'package:addie_store/Controllers/profile_tab_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileTabController c = Get.find();
    return Container(
      width: Get.width,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(children: [
        InkWell(
          onTap: ()async{
            var file = await c.pickImage(imgSource: ImageSource.camera);
            Get.back();
            if(file != null){
              c.uploadProfilePic(file.path);
            }
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.camera),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Camera",
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorConstants.primaryText,
                      fontFamily: AppFonts.shantell_sans,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: ()async{
            var file = await c.pickImage(imgSource: ImageSource.gallery);
            Get.back();
            if(file != null){
              c.uploadProfilePic(file.path);
            }
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: const [
                Icon(Icons.image),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorConstants.primaryText,
                      fontFamily: AppFonts.shantell_sans,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
