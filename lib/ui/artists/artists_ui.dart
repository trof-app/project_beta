import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistViewUI extends StatelessWidget {
  final int index;
  final String title;
  final String imgUrl;
  ArtistViewUI(this.index, this.title, this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Get.theme.bottomAppBarColor,
      ),
      body: Column(
        children: [
          Hero(
            tag: index,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            title,
            style:
                Get.textTheme.headline3.copyWith(fontWeight: FontWeight.bold),
          ),
          Row()
        ],
      ),
    );
  }
}
