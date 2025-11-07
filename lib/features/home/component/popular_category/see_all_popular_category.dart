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
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back_ios),
              ),
              const Text('Popular Categories'),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: vm.allPopularCategoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: PopularCategoryCard(
              width: double.infinity,
              image: vm.allPopularCategoryList[index].thumbnail,
              location: vm.allPopularCategoryList[index].area,
              name: vm.allPopularCategoryList[index].name,
              distance:
                  "${(vm.popularCategoty[index].id.hashCode % 10) + 1} km",
            ),
          );
        },
      ),
    );
  }
}
