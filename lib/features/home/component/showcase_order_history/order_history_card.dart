import 'package:flutter/material.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });

  final String image;
  final String title;
  final String subTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 80,
      width: 330,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          Text(
            'See Details',
            style: TextStyle(color:Colors.grey.shade600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
