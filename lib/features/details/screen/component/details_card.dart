import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.quantity,
  });

  final String image;
  final String title;
  final String subTitle;
  final String price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
          ),

          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subTitle),
                Spacer(),
                Text('\$$price'),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.remove),
                  SizedBox(width: 5),
                  Text(quantity.toString()),
                  SizedBox(width: 5),
                  Icon(Icons.add),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
