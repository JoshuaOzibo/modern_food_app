import 'package:flutter/material.dart';

class CustomShimmer extends StatefulWidget {
  const CustomShimmer({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<CustomShimmer> createState() => _CustomShimmerState();
}

class _CustomShimmerState extends State<CustomShimmer> with SingleTickerProviderStateMixin {

  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    _shimmerController= AnimationController(vsync: this, duration:  const Duration(milliseconds: 1000));

    _shimmerAnimation = Tween<double>(begin: -1.0, end: 2.0).animate(CurvedAnimation(parent: _shimmerController, curve: Curves.easeInSine));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey
        ),
      );
      },
    );
  }
}