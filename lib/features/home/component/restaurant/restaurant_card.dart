import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.image,
    required this.location,
    required this.name,
  });

  final String image;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Image.asset(image), Text(name), Text(location)]);
  }
}
