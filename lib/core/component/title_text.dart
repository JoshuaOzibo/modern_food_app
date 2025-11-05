import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.leftText, required this.rightText, this.handleNavigate});

  final String leftText;
  final String rightText;
  final VoidCallback? handleNavigate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: GestureDetector(
            onTap: handleNavigate,
            child: Row(
              spacing: 5,
              children: [Text(rightText), Icon(Icons.arrow_forward_ios, size: 15)],
            ),
          ),
        ),
      ],
    );
  }
}
