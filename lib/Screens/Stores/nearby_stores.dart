import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/search_bar.dart';
import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Constants/dummy_data.dart';
import 'package:addie_store/Models/shop_search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'Widgets/shop_card.dart';

class NearbyStores extends StatelessWidget {
  const NearbyStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBarWithLocation(),
      body: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SearchBar(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: DummyData.nearbyStores.length,
                  itemBuilder: (ctx, i){
                  return ShopCard(storeModel: DummyData.nearbyStores[i]);
                }),
              )
            ],
          )),
    );
  }

  
}
