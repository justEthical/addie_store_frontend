import 'package:addie_store/CommonWidgets/custom_loader.dart';
import 'package:addie_store/Models/user_profile_model.dart';
import 'package:addie_store/Services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabViewController extends GetxController {
  final PageController tabViewController = PageController();
  var currentTabIndex = 0.obs;
  Rx<UserProfileModel?> userProfile = Rxn<UserProfileModel>(null);
  var profilePic = "".obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _getProfile();
  }

  _getProfile()async{
    CustomLoader.showLoader();
    userProfile.value = await DbService.getProfile();
    profilePic.value = userProfile.value!.profile_pic!;
    CustomLoader.hideLoader();
  }
}