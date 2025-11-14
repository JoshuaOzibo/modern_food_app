import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    super.key,
    required this.height,
    required this.image,
    required this.width,
  });

  final String image;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        color: Colors.grey[200],
        child: Center(
          child: CustomShimmer(height: height, width: width),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        color: Colors.grey[300],
        child: Icon(Icons.image_not_supported, size: 40),
      ),
    );
  }
}
