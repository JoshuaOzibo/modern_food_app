import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.image,
    required this.location,
    required this.name,
    required this.distance
  });

  final String image;
  final String name;
  final String location;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 210,
                height: 150,
                ),
            ),
            Row(
              children: [
                Text(distance),
                Icon(Icons.favorite),
              ],
            )
          ],
        ), 
        Text(name), 
        Text(location)]);
  }
}
