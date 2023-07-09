import 'package:addie_store/Controllers/home_screen_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController c = Get.find();
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: PageView.builder(
        itemCount: c.sponsoredImageLst.length,
        controller: c.adsControllerPageController,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 5),
                  color: Colors.black38,
                  spreadRadius: 5,
                  blurRadius: 5)
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                c.sponsoredImageLst[index],
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
