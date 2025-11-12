import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';
import 'package:modern_food_app/core/extensions/text_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    required this.handleAddToCart,
    required this.width,
    required this.height,
  });

  final String image;
  final String foodType;
  final String title;
  final double rating;
  final double price;
  final String reviews;
  final String distance;
  final VoidCallback handleAddToCart;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => const CustomShimmer(height: 110, width: 130),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: height,
                width: width,
                fit: BoxFit.cover,

              // child: Image.network(
              //   image,
              //   height: height,
              //   width: width,
              //   fit: BoxFit.cover,
              // ),
            ),
            ),

            Positioned(
              top: 5,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(foodType),
                  ),
                  Icon(Icons.favorite),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextExtension(maxWords: 2).limitWords(title),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      '\$${price.toString()}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(distance, style: TextStyle(fontSize: 11)),
                  ],
                ),

                MaterialButton(
                  minWidth: 30,
                  height: 10,
                  elevation: 0,
                  padding: EdgeInsets.all(2),
                  color: Colors.deepOrange,
                  onPressed: handleAddToCart,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
