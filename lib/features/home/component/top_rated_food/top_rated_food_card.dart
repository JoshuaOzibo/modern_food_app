import 'package:flutter/material.dart';

class TopRatedFoodCard extends StatelessWidget {
  const TopRatedFoodCard({
    super.key,
    required this.image,
    required this.foodType,
    required this.title,
    required this.reviews,
    required this.rating,
    required this.price,
    required this.distance,
  });

  final String image;
  final String foodType;
  final String title;
  final double rating;
  final double price;
  final String reviews;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.network(
                image,
                width: 140,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(child: Text(foodType)),
                Icon(Icons.favorite),
              ],
            ),
          ],
        ),

        SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 2,
              children: [
                Icon(Icons.star, size: 15),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('$reviews Reviews', style: TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
                Text(distance, style: TextStyle(fontSize: 11)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
