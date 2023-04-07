import 'package:addie_store/Constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TrendingCard extends StatelessWidget {
  final String img;
  final String title;
  final String price;
  const TrendingCard(
      {super.key, required this.img, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.black12,
                spreadRadius: 5,
                blurRadius: 5)
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 100,
          width: 150,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toString(),
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("₹ $price"),
        )
      ]),
    );
  }
}
