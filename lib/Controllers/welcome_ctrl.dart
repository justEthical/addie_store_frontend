import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {
  final welcomePageCtrl = PageController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    welcomePageCtrl.addListener(() {welcomePageCtrl.page;});
  }
}