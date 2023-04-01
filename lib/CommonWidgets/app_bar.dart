import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CommonAppBar{
  static tabScreensAppBar({required String title}){
    return AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            width: 40,
            height: 30,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2)
                ]),
                child: const Icon(FeatherIcons.bell),
          )
        ],
      );
  }
}