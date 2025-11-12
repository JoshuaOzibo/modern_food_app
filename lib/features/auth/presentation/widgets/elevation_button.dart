import 'package:flutter/material.dart';
import 'package:modern_food_app/core/theme/theme.dart';

class ElevationButton extends StatelessWidget {
  const ElevationButton({
    super.key,
    required this.buttonText,
    required this.handleButtonPressed,
  });

  final String buttonText;
  final VoidCallback handleButtonPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: handleButtonPressed,
        child: Text(buttonText, style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
