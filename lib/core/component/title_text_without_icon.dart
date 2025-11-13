import 'package:flutter/material.dart';

class TitleTextWithoutIcon extends StatelessWidget {
  const TitleTextWithoutIcon({
    super.key,
    required this.leftText,
    this.itemLength,
    required this.rightText,
    required this.hasBox,
  });

  final String leftText;
  final String? itemLength;
  final String rightText;
  final bool hasBox;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Text(
              leftText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 15,
              ),
            ),

            if (hasBox)
              Container(
                height: 20,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Text(
                  itemLength.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold,),
                ),
              ),
          ],
        ),
        Row(spacing: 5, children: [Text(rightText, style: TextStyle(color: Colors.white),)]),
      ],
    );
  }
}
