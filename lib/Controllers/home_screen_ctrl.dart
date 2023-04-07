import 'package:addie_store/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final PageController adsControllerPageController = PageController();
  bool isStopSponsoredSlider = false;
  bool isOnceInitialized = false;
  var sponsoredImageLst = <String>[
    Strings.biryaani,
    Strings.kfc,
    // Strings.cokeZero,
    Strings.Aashirvaad,
    Strings.fortuneOil,
    // Strings.iceCream
    Strings.havmourIceCream
  ];

  changeAdPagePeriodically() async {
    int counter = 0;
    for(var i=0; i< sponsoredImageLst.length; i++) {
      await Future.delayed(const Duration(seconds: 4));
      try{
        
        // if(!isStopSponsoredSlider){
          // print(i);
          adsControllerPageController.animateToPage(i,
          duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
          
        // }else{
        //   break;
        // }
      }catch(e){
        print(e.toString());
      }
      if(i == sponsoredImageLst.length-1){
        changeAdPagePeriodically();
      }
    }
  }
}
