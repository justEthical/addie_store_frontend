import 'dart:convert';

import 'package:addie_store/Constants/string_constants.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Models/user_profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DbService {
  static String uid = FirebaseAuth.instance.currentUser!.uid;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> createProfile(UserProfileModel user) async {
    var profile = firestore.collection(Strings.USER_PROFILE);
    await profile
        .doc(uid)
        .set(user.toJason())
        .then((value) => print("profile added successfully"));
  }

  static Future<void> getProfile() async {
    final TabViewController c = Get.find();
    var profile =
        await firestore.collection(Strings.USER_PROFILE).doc(uid).get();
    c.userProfile = UserProfileModel.fromJson(profile.data());
  }
}
