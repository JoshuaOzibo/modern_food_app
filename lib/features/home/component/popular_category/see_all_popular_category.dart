import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/component/popular_category/popular_category_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SeeAllPopularCategory extends StatelessWidget {
  const SeeAllPopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Popular Categories')),
      body: ListView.builder(
        itemCount: vm.allPopularCategoryList.length,
        itemBuilder: (context, index) {
          return PopularCategoryCard(
            width: double.infinity,
            image: vm.allPopularCategoryList[index].thumbnail,
            location: vm.allPopularCategoryList[index].area,
            name: vm.allPopularCategoryList[index].name,
            distance: "${(vm.popularCategoty[index].id.hashCode % 10) + 1} km",
          );
        },
      ),
    );
  }
}
