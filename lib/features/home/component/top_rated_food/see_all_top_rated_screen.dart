import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/error_view.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/all_top_rated_shimmer.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SeeAllTopRatedScreen extends StatefulWidget {
  const SeeAllTopRatedScreen({super.key});

  @override
  State<SeeAllTopRatedScreen> createState() => _SeeAllTopRatedScreenState();
}

class _SeeAllTopRatedScreenState extends State<SeeAllTopRatedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().allTopRatedFood();
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
              const Text('Top Rated Food'),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (_) {
          if (vm.isLoadingAllTopFood) {
            return const Center(child: const AllTopRatedShimmer());
          }

          if (vm.allTopFooderrorMessage) {
            return Center(
              child: ErrorView(
                message: 'Error Fetching Top Rated Food',
                onRetry: () => vm.allTopRatedFood(),
              ),
            );
          }

          if (vm.allTopRatedFoodList.isEmpty) {
            return const Center(child: Text('No foods found.'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              itemCount: vm.allTopRatedFoodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final item = vm.allTopRatedFoodList[index];
                final idValue = item.id;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TopRatedFoodCard(
                    width: double.infinity,
                    height: 100,
                    image: item.thumbnail,
                    foodType: item.category,
                    title: item.name,
                    reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                    rating: (idValue.hashCode % 5) + 1,
                    price: (5 + (idValue.hashCode % 20)),
                    distance: item.area,
                    handleAddToCart: () => print('Add to cart'),
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
