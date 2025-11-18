import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/custom_cache_network_image.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final String image;
  final String title;
  final String subtitle;
  final double? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300,
      ),
      child: Row(
        spacing: 10,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: CustomCacheNetworkImage(
              height: 150,
              image: image,
              width: 150,
            ),
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(subtitle, style: TextStyle(color: Colors.black)),
              Text(
                '\$${price.toString()}',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
