import 'package:addie_store/CommonWidgets/app_bar.dart';
import 'package:addie_store/CommonWidgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class GrocerySection extends StatefulWidget {
  const GrocerySection({super.key});

  @override
  State<GrocerySection> createState() => _GrocerySectionState();
}

class _GrocerySectionState extends State<GrocerySection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.appBarWithLocation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SearchBar(),
            SizedBox(height: 10,),
            const Text("Get your delivery in"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FeatherIcons.zap),
                SizedBox(width: 10,),
                Text(
                  "10-15 mins",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.brown,
                      fontSize: 22),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
