import 'package:addie_store/Screens/LoginAndSignup/login_signup.dart';
import 'package:addie_store/Screens/TabView/tab_view.dart';
import 'package:addie_store/Services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_profile_model.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static User? user;

  static Future<void> registerUser(
      {required String email,
      required String password,
      String? name,
      required String phone}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        user = userCredential.user;
        DbService.createProfile(UserProfileModel(
          full_name: name??"User",
          email: user!.email,
          phone_number: user!.phoneNumber??"",
          profile_pic: user!.photoURL??"",
        ));
        await loginPersistent();
        Get.offAll(TabView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Oops! $e");
      print(e);
    }
  }

  static Future<void> googleSignInSignUp() async {
    // google signIn pop up
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // authorizing google account
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      // Creating AuthCredential for firebase signIn
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Firebase singIn
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        DbService.createProfile(UserProfileModel(
          full_name: user!.displayName,
          email: user!.email,
          phone_number: user!.phoneNumber??"",
          profile_pic: user!.photoURL!??"",
        ));
        await loginPersistent();
        Get.offAll(TabView());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          Fluttertoast.showToast(
              msg: "Account exists with different credential");
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          Fluttertoast.showToast(msg: "Credential not valid");
        }
      } catch (e) {
        // handle the error here
        Fluttertoast.showToast(msg: "Oops! $e");
      }
    }
  }

  static Future<void> emailLogin(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      if (user != null) {
        await loginPersistent();
        Get.offAll(TabView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg:
                "This email is registered with google, please use google sign in");
        print(
            'This email is registered with google, please use google sign in');
      } else {
        Fluttertoast.showToast(msg: e.toString());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Oops! $e");
      print(e);
    }
  }

  static Future<void> logout() async {
    try {
      await googleSignIn.signOut();
      await auth.signOut();
      final _prefs = await SharedPreferences.getInstance();
      _prefs.remove("loggedIn");
      Get.offAll(const LoginSignUp());
    } catch (e) {
      print("Logout error $e");
    }
  }

  static loginPersistent() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("loggedIn", true);
  }
}
