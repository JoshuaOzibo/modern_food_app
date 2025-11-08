import 'package:flutter/material.dart';

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
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade300
      ),
      child: Row(
        spacing: 10,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            child: Image.asset(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
              ),
          ),
          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(title, style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold
            ),), Text(subtitle), Text('\$${price.toString()}')]),
        ],
      ),
    );
  }
}
