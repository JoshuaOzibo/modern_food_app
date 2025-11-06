import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SeeAllTopRatedScreen extends StatelessWidget {
  const SeeAllTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final AppStaticData localData = AppStaticData();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios),
              ),
              Text('Top Rated Food'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: vm.allTopRatedFoodList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            final idValue = vm.allTopRatedFoodList[index].id;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TopRatedFoodCard(
                width: double.infinity,
                height: 100,
                image: vm.allTopRatedFoodList[index].thumbnail,
                foodType: vm.allTopRatedFoodList[index].category,
                title: vm.allTopRatedFoodList[index].name,
                reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                rating: (idValue.hashCode % 5) + 1,
                price: (5 + (idValue.hashCode % 20)),
                distance: vm.allTopRatedFoodList[index].area,
                handleAddToCart: () => print('Hello'),
              ),
            );
          },
        ),
      ),
    );
  }
}
