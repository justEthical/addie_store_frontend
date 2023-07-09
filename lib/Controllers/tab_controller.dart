import 'package:addie_store/Models/user_profile_model.dart';
import 'package:addie_store/Services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabViewController extends GetxController {
  final PageController tabViewController = PageController();
  var currentTabIndex = 0.obs;
  UserProfileModel? userProfile;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    DbService.getProfile();
  }
}