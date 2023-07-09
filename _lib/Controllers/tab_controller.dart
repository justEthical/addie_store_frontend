import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabViewController extends GetxController {
  final PageController tabViewController = PageController();
  var currentTabIndex = 0.obs;
}