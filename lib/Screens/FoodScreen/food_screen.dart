import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/search_bar.dart';
import 'package:addie_store/Constants/app_assets.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  var popularInDishesYourCity = [
    Strings.pizza,
    Strings.biryaaniFood,
    Strings.burger,
    Strings.rolls,
    Strings.chicken,
    Strings.cake,
    Strings.momos,
    Strings.thali,
    Strings.dosa,
    Strings.chowmein,
    Strings.sandwhich,
    Strings.paneer
  ];
  var popularInDishesYourCityName = [
    "Pizza",
    "Biryaani",
    "Burger",
    "Rolls",
    "Chicken",
    "Cake",
    "Momos",
    "Thali",
    "Dosa",
    "Chowmein",
    "Sandwich",
    "Paneer",
  ];

  var topBrands = [
    Strings.macDonland,
    Strings.dominoz,
    Strings.burgerKing,
    Strings.subway,
    Strings.haldiram,
    Strings.kfcFood,
    Strings.kaleva,
    // Strings.bikanervala,
    Strings.bikkganeBiryani,
    Strings.pizzaHut
  ];

  var topBrandsNames = [
    "Mac Delivery",
    "Domino's",
    "Burger king",
    "Subway",
    "Haldiram's",
    "KFC",
    "Kaleva",
    "Bikkgane",
    "Pizza Hut"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBarWithLocation(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: const SearchBar()),
            const Text(
              "Popular in your city",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularInDishesYourCity.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                popularInDishesYourCity[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              popularInDishesYourCityName[i],
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Today's special",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width - 40,
              height: 175,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    Strings.todaySpecial,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Top Brands",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: 150,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topBrands.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                topBrands[i],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              topBrandsNames[i],
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  _topBrands(img) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorConstants.primaryText),
          borderRadius: BorderRadius.circular((Get.width - 50) * 0.3)),
      width: (Get.width - 50) * 0.3,
      height: (Get.width - 50) * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular((Get.width - 50) * 0.3),
        child: Image.network(
          img,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
