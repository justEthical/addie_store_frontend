import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/search_bar.dart';
import 'package:addie_store/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class GrocerySection extends StatefulWidget {
  const GrocerySection({super.key});

  @override
  State<GrocerySection> createState() => _GrocerySectionState();
}

class _GrocerySectionState extends State<GrocerySection> {
  var hotDealsList = [
    Strings.hotDeals1,
    Strings.hotDeals2,
    Strings.hotDeals3,
    Strings.hotDeals4,
    Strings.hotDeals5
  ];

  var categories = [
    Strings.masala,
    Strings.chocolate,
    Strings.frozen,
    Strings.packageFood,
    Strings.dairy,
    Strings.juice,
    Strings.munchies,
    Strings.meat,
    Strings.breakfast,
    Strings.tea,
    Strings.biscuite,
    Strings.makeUp,
    Strings.bathBody,
    Strings.cleaning,
    Strings.homeNeed,
    Strings.health
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBarWithLocation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const SearchBar(),
            const SizedBox(
              height: 10,
            ),
            const Center(child: Text("Get your delivery in")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FeatherIcons.zap),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "10-15 mins",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.brown,
                      fontSize: 22),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hot Deals!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const Text("Get upto 30% percent discount"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              width: Get.width - 50,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: hotDealsList
                      .map((e) => Container(
                            height: 100,
                            width: Get.width - 150,
                            margin: const EdgeInsets.only(right: 15),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                )),
                          ))
                      .toList()),
            ),
            const SizedBox(height: 20,),
            const Text(
              "Shop by category",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: categories.map((e) => Image.network(e)).toList()),
            )
          ],
        ),
      ),
    );
  }
}
