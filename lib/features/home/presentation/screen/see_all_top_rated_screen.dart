import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/empty_state.dart';
import 'package:modern_food_app/features/home/presentation/widgets/top_rated/all_top_rated_shimmer.dart';
import 'package:modern_food_app/features/home/presentation/widgets/top_rated/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class SeeAllTopRatedScreen extends StatefulWidget {
  const SeeAllTopRatedScreen({super.key});

  @override
  State<SeeAllTopRatedScreen> createState() => _SeeAllTopRatedScreenState();
}

class _SeeAllTopRatedScreenState extends State<SeeAllTopRatedScreen> {
  // Track favorite items by ID
  final Set<String> _favoriteIds = <String>{};

  void _toggleFavorite(String id, bool isFavorite) {
    setState(() {
      if (isFavorite) {
        _favoriteIds.add(id);
      } else {
        _favoriteIds.remove(id);
      }
    });
    // TODO: Add to favorite viewmodel/repository here if needed
    print('Favorite ${isFavorite ? "added" : "removed"}: $id');
  }

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
              child: EmptyState(
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
                final isFavorite = _favoriteIds.contains(idValue);
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
                    isFavorite: isFavorite,
                    onFavoriteToggle: (fav) => _toggleFavorite(idValue, fav),
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
