import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.leftText, required this.rightText});

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leftText),
        Row(children: [Text(rightText), Icon(Icons.arrow_forward_ios)]),
      ],
    );
  }
}
