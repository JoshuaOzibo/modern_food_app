import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/error_view.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/presentation/widgets/popular_category/popular_category_card.dart';
import 'package:modern_food_app/features/home/presentation/widgets/popular_category/popular_category_shimmer.dart';
import 'package:modern_food_app/features/home/presentation/screen/see_all_popular_category.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';

class PopularCategory extends StatelessWidget {
  const PopularCategory({super.key, required this.vm});
  final HomeViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TitleText(
          leftText: 'Popular Categories',
          rightText: 'View all',
          handleNavigate: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeeAllPopularCategory()),
            );
            vm.allPopularCategory();
          },
        ),

        if (vm.isLoadingFoodCategory)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Center(child: const PopularCategoryShimmer()),
          ),
        if (!vm.isLoadingFoodCategory && vm.foodCategoryerrorMessage)
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 90),
              child: ErrorView(
                icon: Icons.error_outline,
                message: 'Error Fetching Popular Categories',
                onRetry: () {
                  vm.foodCategoryFunc();
                },
              ),
            ),
          ),
        SizedBox(
          height: vm.popularCategoty.isNotEmpty ? 200 : 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vm.popularCategoty.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: PopularCategoryCard(
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
