import 'package:flutter/material.dart';

class SelectByCategoryCard extends StatelessWidget {
  const SelectByCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Image.asset('assets/images/chilli-9202873_1280.jpg', cacheHeight: 100, width: double.infinity,),
        Text('Hello'),
        Text('Hello')
        ],
      ),
    );
  }
}