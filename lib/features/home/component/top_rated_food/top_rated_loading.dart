import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/shimmer.dart';

class TopRatedLoading extends StatelessWidget {
  const TopRatedLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      height: 200,
      width: 150,
    );
  }
}