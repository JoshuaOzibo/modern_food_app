import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.handleCircularButtonTap,
    this.color,
    this.height,
    this.width,
    this.widget,
  });

  final Widget? widget;
  final double? height;
  final double? width;
  final Color? color;
  final Function handleCircularButtonTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        handleCircularButtonTap;
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100)
          ),
        child: widget,
      ),
    );
  }
}
