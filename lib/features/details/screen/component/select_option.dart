import 'package:flutter/material.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({super.key});

  @override
  Widget build(BuildContext context) {
    final selectList = ['Delivery', 'Take away', 'Dine in'];
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...selectList.map(
            (item) => GestureDetector(
              onTap: () => print(item),
              child: Container(child: Text(item)),
            ),
          ),
        ],
      ),
    );
  }
}
