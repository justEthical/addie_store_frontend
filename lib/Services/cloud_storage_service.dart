import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudStorage{
  static final storageRef = FirebaseStorage.instance.ref();
  static String uid = FirebaseAuth.instance.currentUser!.uid;
  

  
  static Future<String?> uploadProfilePic(String filePath)async{
    print("HERE :::::::>");
    try{
      final profilePic = storageRef.child("profile_pic/$uid.png");
      var res = profilePic.putFile(File(filePath));
      final snapshot = await res.whenComplete(() => print("uploaded"));
      var url = await snapshot.ref.getDownloadURL();
      print(url);
      return url;
    }catch(e){
      print("ERROR::::::::::::" + e.toString());
    }
  }
}