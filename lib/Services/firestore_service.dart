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

  static Future<UserProfileModel> getProfile() async {
    var profile =
        await firestore.collection(Strings.USER_PROFILE).doc(uid).get();
    var userProfile = UserProfileModel.fromJson(profile.data());
    return userProfile;
  }

  static Future updateProfile(
      {String? fullName, String? phoneNumber, String? profilePic}) async {
    Map<String, dynamic> data = {};
    fullName != null ? data["full_name"] = fullName : null;
    phoneNumber != null ? data["phone_number"] = phoneNumber : null;
    profilePic != null ? data["profile_pic"] = profilePic : null;
    try {
      var updated = await firestore
          .collection(Strings.USER_PROFILE)
          .doc(uid)
          .update(data);
    } catch (e) {
      print(e.toString());
    }
  }
}
