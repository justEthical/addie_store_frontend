import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NearbyStores extends StatelessWidget {
  const NearbyStores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBarWithLocation(),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(children: [
          SearchBar()
        ],)),
    );
  }
}