import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Screens/Home/home.dart';
import 'package:addie_store/Screens/Profile/profile_screen.dart';
import 'package:addie_store/Screens/TabView/Widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabView extends StatefulWidget {
  TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final c = Get.put(TabViewController());

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    // do something
    c.tabViewController.jumpToPage(0);
    c.currentTabIndex.value = 0;
  });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: PageView(
          controller: c.tabViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
          // Container(color: Colors.green,),
          const HomeScreen(),
          Container(color: Colors.amber),
          Container(color: Colors.green,),
          // Container(color: Colors.brown,),
          const ProfileScreen()
        ],),
        bottomNavigationBar: const CustomBottomBar());
  }
}
