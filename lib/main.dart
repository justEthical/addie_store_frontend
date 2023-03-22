import 'package:addie_store/Constants/fonts.dart';
import 'package:addie_store/Screens/Welcome/welcome.dart';
import 'package:addie_store/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/LoginAndSignup/login_signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Addie Store',
      // color: 
      theme: ThemeData(
        fontFamily: AppFonts.figtree,
        primarySwatch: Colors.orange,
      ),
      home: const Wrapper(),
    );
  }
}

