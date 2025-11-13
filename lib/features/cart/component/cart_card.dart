import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({
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
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    image,
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$quantity',
                    style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  color: Colors.black
                ),),
                Text(subTitle, style: TextStyle(
                  color: Colors.black
                ),),
                Spacer(),
                Text('\$$price', style: TextStyle(
                  color: Colors.black
                ),),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade800,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.remove, size: 16, color: Colors.black,),
                    ),
                    SizedBox(width: 5),
                    Text(quantity.toString()),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.add, size: 16, color: Colors.black,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
