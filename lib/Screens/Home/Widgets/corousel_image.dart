import 'package:addie_store/Constants/string_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imgUrl;
  CarouselImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: Strings.biryaani,
          fit: BoxFit.cover,
        ));
  }
}
