import 'dart:io';

import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Services/cloud_storage_service.dart';
import 'package:addie_store/Services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTabController extends GetxController {
  final TabViewController tvc = Get.find();
  Future<File?> pickImage({required ImageSource imgSource}) async {
    final ImagePicker picker = ImagePicker();
    var pic = await picker.pickImage(source: imgSource);
    if (pic != null) {
      return File(pic.path);
    }
    return null;
  }

  Future<String?> uploadProfilePic(String path) async {
    Get.showSnackbar(
      const GetSnackBar(
        title: "Uploading photo...",
        // message: '',
        messageText: SizedBox(),
        icon: Icon(Icons.refresh),
        duration: Duration(seconds: 3),
      ),
    );

    String? profilePic = await CloudStorage.uploadProfilePic(path);
    if (profilePic != null) {

      tvc.userProfile.value!.profile_pic = profilePic;
      tvc.profilePic.value = profilePic;
      DbService.updateProfile(profilePic: profilePic);
    }
    Get.closeAllSnackbars();
    return null;
  }
}
