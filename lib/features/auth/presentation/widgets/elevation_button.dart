import 'package:flutter/material.dart';

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
        style: ElevatedButton.styleFrom(fixedSize: Size(double.infinity, 55), side: BorderSide(
          width: 2, color: Colors.blue
        )),
        child: Text(buttonText),
      ),
    );
  }
}
