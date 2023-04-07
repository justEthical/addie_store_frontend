import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesCard extends StatelessWidget {
  final String icon;
  final String title;
  const CategoriesCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 120,
        margin: const EdgeInsets.only(right: 10),
        // padding: const EdgeInsets.only(top: 10),
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
        child: InkWell(
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 50, height: 50, child: SvgPicture.asset(icon)),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.brown),
              )
            ],
          ),
        ));
  }
}
