import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final PageController adsControllerPageController = PageController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _changeAdPagePeriodically();
  }

  _changeAdPagePeriodically() async {
    int counter = 0;
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      adsControllerPageController.animateToPage(counter,
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
      if (counter < 5) {
        counter++;
      } else {
        counter = 0;
      }
    }
  }
}
