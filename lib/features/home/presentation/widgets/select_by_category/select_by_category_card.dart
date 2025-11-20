import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/custom_cache_network_image.dart';
import 'package:modern_food_app/core/extensions/text_extension.dart';

class SelectByCategoryCard extends StatelessWidget {
  const SelectByCategoryCard({super.key, required this.image, required this.height, required this.width, required this.title, required this.subtitle});

  final String image;
  final double height;
  final double width;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          CustomCacheNetworkImage(
            height: height, 
            image: image, 
            width: width,
          ),
          Text(TextExtension().limitWords(title, maxwords: 1), style: TextStyle(color: Colors.white),),
          Text(subtitle, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}