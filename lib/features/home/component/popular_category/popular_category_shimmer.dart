import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';

class PopularCategoryShimmer extends StatelessWidget {
  const PopularCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(height: 140, width: 210),
                SizedBox(height: 10),
                CustomShimmer(height: 10, width: 205),
                SizedBox(height: 10),
                CustomShimmer(height: 10, width: 100),
              ],
            ),
          );
        },
      ),
    );
  }
}