import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/features/favorite/component/favorite_card.dart';
import 'package:modern_food_app/features/favorite/viewmodel/favorite_view_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<FavoriteViewModel>();
    final appData = AppStaticData().cartData;
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite', style: TextStyle(fontSize: 18),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(Icons.favorite),
        )
      ],
      ),
      body: ListView.builder(
        itemCount: vm.favoriteList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 5),
            child: FavoriteCard(
              image: vm.favoriteList[index].thumbnail,
              title: vm.favoriteList[index].name,
              subtitle: vm.favoriteList[index].category,
              price: vm.favoriteList[index].price,
            ),
          );
        },
      ),
    );
  }
}
