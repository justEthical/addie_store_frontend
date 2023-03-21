import 'package:addie_store/Screens/TabView/tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User? user;

  static Future<void> registerUser(
      {required String email,
      required String password,
      required String phone}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        user = userCredential.user;
        Get.offAll(const TabView());
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

  static Future<void> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
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
      final credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user;
      if (user != null) {
        Get.offAll(const TabView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg:
                "This email is registered with google, please use google sign in");
        print(
            'This email is registered with google, please use google sign in');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Oops! $e");
      print(e);
    }
  }
}
