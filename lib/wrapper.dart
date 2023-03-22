import 'package:addie_store/Screens/LoginAndSignup/login_signup.dart';
import 'package:addie_store/Screens/TabView/tab_view.dart';
import 'package:addie_store/Screens/Welcome/welcome.dart';
import 'package:addie_store/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _appState(),
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.data == 'firstInstall') {
              return const WelcomeScreens();
            } else if (snap.data == "loggedIn") {
              return TabView();
            } else {
              return const LoginSignUp();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber.shade900,
                strokeWidth: 2,
              ),
            );
          }
        });
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
