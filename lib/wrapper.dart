import 'package:addie_store/Screens/LoginAndSignup/login_signup.dart';
import 'package:addie_store/Screens/TabView/tab_view.dart';
import 'package:addie_store/Screens/Welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    _conditionalRouting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.amber.shade900,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Future<void> _conditionalRouting() async {
    var condition = await _appState();
    if (condition == 'firstInstall') {
      Get.offAll(const WelcomeScreens());
    } else if (condition == "loggedIn") {
      Get.offAll(TabView());
    } else {
      Get.offAll(const LoginSignUp());
    }
  }

  Future<String> _appState() async {
    final _prefs = await SharedPreferences.getInstance();
    var isFirstInstall = _prefs.getBool("firstInstall") ?? true;
    if (isFirstInstall) {
      return "firstInstall";
    }
    if (_prefs.getBool("loggedIn") ?? false) {
      return "loggedIn";
    }
    return "";
  }
}
