import 'package:flutter/material.dart';

class CartOption extends StatelessWidget {
  const CartOption({
    super.key,
    required this.selectedOption,
    required this.onOptionChanged,
    required this.selectList,
  });
  final String selectedOption;
  final Function(String) onOptionChanged;
  final List<String> selectList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: List.of([
          BoxShadow(
            color: const Color.fromARGB(255, 179, 179, 179),
            blurRadius: 4,
            blurStyle: BlurStyle.outer,
            // spreadRadius: 10,
            offset: Offset(3, 3),
          ),
        ]),
      ),
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Row(
        spacing: 10,
        children: [
          ...selectList.map(
            (item) => Expanded(
              child: GestureDetector(
                onTap: () {
                  onOptionChanged(item);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5, left: 5, right: 5),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedOption == item
                        ? Colors.deepOrange
                        : null,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.center,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: selectedOption == item
                          ? Colors.white
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
