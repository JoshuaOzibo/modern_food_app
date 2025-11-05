import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/error_view.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/restaurant/restaurant_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Popular Categories', rightText: 'View all'),

        if (vm.isLoadingFoodCategory)
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: const Center(child: CircularProgressIndicator()),
          ),
        if (!vm.isLoadingFoodCategory && vm.foodCategoryerrorMessage)
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              child: ErrorView(
                message: 'Error Fetching Popular Categories',
                onRetry: () {
                  vm.foodCategoryFunc();
                },
              ),
            ),
          ),
        SizedBox(
          height: vm.popularCategoty.isNotEmpty ? 200 : 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vm.popularCategoty.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: RestaurantCard(
                  image: vm.popularCategoty[index].thumbnail,
                  location: vm.popularCategoty[index].area,
                  name: vm.popularCategoty[index].name,
                  distance:
                      "${(vm.popularCategoty[index].id.hashCode % 10) + 1} km",
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
