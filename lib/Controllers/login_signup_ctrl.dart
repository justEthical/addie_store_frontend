import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUpController extends GetxController {
  // form keys
  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();

  // Text fields controllers
  TextEditingController loginEmail  = TextEditingController();
  TextEditingController loginPassword  = TextEditingController();
  TextEditingController registerEmail  = TextEditingController();
  TextEditingController registerPassword  = TextEditingController();
  TextEditingController registerConfirmPassword = TextEditingController();
  TextEditingController registerPhoneNo = TextEditingController();

  // login register switch variables  
  var isLogin = true.obs;
  var switchButtonText = "Login".obs;
}