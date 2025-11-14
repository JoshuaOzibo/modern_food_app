import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';

class AllPopularCategoryShimmer extends StatelessWidget {
  const AllPopularCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, index){
      return Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            CustomShimmer(height: 150, width: double.infinity),
            CustomShimmer(height: 10, width: double.infinity),
            CustomShimmer(height: 10, width: 100),
          ],
        ),
      );
    });
  }
}