import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/features/favorite/component/favorite_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appData = AppStaticData().cartData;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Screen', style: TextStyle(fontSize: 18),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.favorite),
        )
      ],
      ),
      body: ListView.builder(
        itemCount: appData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 5),
            child: FavoriteCard(
              image: appData[index]['image'],
              title: appData[index]['title'],
              subtitle: appData[index]['subTitle'],
              price: appData[index]['price'],
            ),
          );
        },
      ),
    );
  }
}
