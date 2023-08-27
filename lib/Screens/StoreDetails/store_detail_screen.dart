import 'package:addie_store/Constants/color_constants.dart';
import 'package:addie_store/Models/shop_search_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StoreDetailScreen extends StatelessWidget {
  final StoreModel storeModel;
  const StoreDetailScreen({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (ctx, _) {
            print(_);
            return [
              SliverAppBar(
                expandedHeight: 240,
                // pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  // title: Text(''),
                  background: Hero(
                    tag: storeModel.address,
                    child: CachedNetworkImage(
                      imageUrl: storeModel.imageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  storeModel.name,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  storeModel.address,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: storeModel.tags.map((e) => _tags(e)).toList(),
                )
              ],
            ),
          )),
    );
  }

  Widget _tags(String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.primaryText.withOpacity(0.6)),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      margin: const EdgeInsets.only(right: 5, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
