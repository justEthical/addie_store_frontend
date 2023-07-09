import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/notification_icon.dart';
import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/string_constants.dart';
import 'package:addie_store/Controllers/home_screen_ctrl.dart';
import 'package:addie_store/Screens/Home/Widgets/categories_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Widgets/corousel_image.dart';
import '../../CommonWidgets/search_bar.dart';
import 'Widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final c = Get.put(HomeScreenController());
  final categoriesIcons = [
    {"Burger": AppAssets.burger},
    {"Pizza": AppAssets.pizza},
    {"Meal": AppAssets.meal},
    {"Chicken": AppAssets.chicken},
    {"Drink": AppAssets.drink}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c.isStopSponsoredSlider = false;
    if (!c.isOnceInitialized) {
      c.changeAdPagePeriodically();
      c.isOnceInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar.appBarWithLocation(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sponsered",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                const CarouselImage(),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: SmoothPageIndicator(
                  controller: c.adsControllerPageController,
                  count: 5,
                  effect: const ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      activeDotColor: ColorConstants.primaryText),
                )),
                Center(child: SearchBar()),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: categoriesIcons
                          .map((e) => CategoriesCard(
                                icon: e.entries.first.value,
                                title: e.entries.first.key,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      "Trending",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      FeatherIcons.trendingUp,
                      color: ColorConstants.primaryText,
                      size: 18,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TrendingCard(
                        img: Strings.fortuneOil,
                        title: "Forturne Oil",
                        price: "1020",
                      ),
                      TrendingCard(
                          img: Strings.kfc, title: "KFC chicken", price: "250"),
                      TrendingCard(
                          img: Strings.biryaani,
                          title: "Biryaani",
                          price: "750")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    c.isStopSponsoredSlider = true;
    print("disposed ***************************>");
  }
}
