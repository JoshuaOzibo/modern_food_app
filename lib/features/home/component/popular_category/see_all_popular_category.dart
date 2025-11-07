import 'package:flutter/material.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile();
      },
    );
  }
}
