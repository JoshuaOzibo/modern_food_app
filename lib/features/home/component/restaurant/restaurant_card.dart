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
      children: [
        Stack(
          children: [
            Image.asset(image),
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
