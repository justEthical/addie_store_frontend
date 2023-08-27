import 'dart:ui';

import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Controllers/tab_controller.dart';
import 'package:addie_store/Screens/Profile/Widgets/phone_number_txt_fiield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ProfileOptionTile extends StatefulWidget {
  final IconData icon;
  final String heading;
  final String content;
  final onTap;
  const ProfileOptionTile(
      {super.key,
      this.heading = "",
      required this.content,
      required this.icon,
      required this.onTap});

  @override
  State<ProfileOptionTile> createState() => _ProfileOptionTileState();
}

class _ProfileOptionTileState extends State<ProfileOptionTile> {
  @override
  Widget build(BuildContext context) {
    final TabViewController tbvc = Get.find();

    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        InkWell(
            onTap: widget.onTap,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 5),
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 2)
                          ]),
                      padding: const EdgeInsets.all(10),
                      child: Icon(widget.icon),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.heading,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: Get.width - 100,
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                widget.heading == "Phone" &&
                                        tbvc.userProfile.value!.phone_number! ==
                                            ""
                                    ? "Enter phone number"
                                    : widget.content,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              widget.heading == "Phone" &&
                                      tbvc.userProfile.value!.phone_number! ==
                                          ""
                                  ? IconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.all(1),
                                      icon: const Icon(Icons.add_box))
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ))
      ],
    );
  }
}
