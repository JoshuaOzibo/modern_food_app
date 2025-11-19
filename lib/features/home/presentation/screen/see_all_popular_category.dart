import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/empty_state.dart';
import 'package:modern_food_app/features/home/presentation/widgets/popular_category/all_popular_category_shimmer.dart';
import 'package:modern_food_app/features/home/presentation/widgets/popular_category/popular_category_card.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SeeAllPopularCategory extends StatefulWidget {
  const SeeAllPopularCategory({super.key});

  @override
  State<SeeAllPopularCategory> createState() => _SeeAllTopRatedScreenState();
}

class _SeeAllTopRatedScreenState extends State<SeeAllPopularCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().allPopularCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios),
              ),
              const Text('Popular Category'),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (_) {
          if (vm.isLoadingAllFoodCategory) {
            return const Center(child: const AllPopularCategoryShimmer());
          }

          if (vm.allFoodCategoryErrorMessage) {
            return Center(
              child: EmptyState(
                message: 'Error Fetching Popular category',
                onRetry: () => vm.allTopRatedFood(),
              ),
            );
          }

          if (vm.allPopularCategoryList.isEmpty) {
            return const Center(child: Text('No foods found.'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:  ListView.builder(
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
        },
      ),
    );
  }
}

