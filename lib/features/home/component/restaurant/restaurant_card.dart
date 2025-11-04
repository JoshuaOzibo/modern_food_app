import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
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

        Text(name),
        Text(location),
      ],
    );
  }
}
