import 'package:flutter/material.dart';
import 'package:modern_food_app/core/extensions/text_extension.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard({
    super.key,
    required this.image,
    required this.location,
    required this.name,
    required this.distance,
  });

  final String image;
  final String name;
  final String location;
  final String distance;

  @override
  Widget build(BuildContext context) {
    final extension = TextExtension();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 210,
                height: 150,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    distance,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.favorite, color: Colors.white),
                ],
              ),
            ),
          ],
        ),

        Text(extension.limitWords(name)),
        Text(location),
      ],
    );
  }
}
