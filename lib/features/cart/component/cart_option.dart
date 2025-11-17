import 'package:flutter/material.dart';

class CartOption extends StatelessWidget {
    const CartOption({super.key, required this.selectedOption, required this.onOptionChanged});
  final String selectedOption;
  final Function(String) onOptionChanged;

  @override
  Widget build(BuildContext context) {
  
    return Container(
      decoration: BoxDecoration(
        boxShadow: List.of([
          BoxShadow(
            color: const Color.fromARGB(255, 179, 179, 179),
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
            // spreadRadius: 10,
            offset: Offset(3, 3),
          ),
        ]),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...['Delivery', 'Take away', 'Dine in'].map((item) => Expanded(
            child: GestureDetector(
              onTap: () => onOptionChanged(item),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: selectedOption == item ? Colors.deepOrange : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                child: Text(
                  item,
                  style: TextStyle(
                    color: selectedOption == item ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
