import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';

class AllTopRatedShimmer extends StatelessWidget {
  const AllTopRatedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          return Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomShimmer(height: 120, width: double.infinity),
              CustomShimmer(height: 10, width: double.infinity),
              CustomShimmer(height: 10, width: 100),
            ],
          );
        },
      ),
    );
  }
}
