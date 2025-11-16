import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/error_view.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:modern_food_app/features/home/presentation/screen/see_all_top_rated_screen.dart';
import 'package:modern_food_app/features/home/presentation/widgets/top_rated/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/presentation/widgets/top_rated/top_rated_shimmer.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/models/product_ui_model.dart';
import 'package:provider/provider.dart';

class TopRatedFoodSection extends StatefulWidget {
  const TopRatedFoodSection({super.key, required this.vm});
  final HomeViewModel vm;

  @override
  State<TopRatedFoodSection> createState() => _TopRatedFoodSectionState();
}

class _TopRatedFoodSectionState extends State<TopRatedFoodSection> {
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

    print('favorite ids: $_favoriteIds');
    // TODO: Add to favorite viewmodel/repository here if needed
    print('Favorite ${isFavorite ? "added" : "removed"}: $id');
  }

  @override
  Widget build(BuildContext context) {  
    final cartVM = context.read<CartViewmodel>();
    print('from rating ${widget.vm.topRatedFood}');
    return Column(
      spacing: 10,
      children: [
        TitleText(
          leftText: 'Top Rated Food',
          rightText: 'View all',
          handleNavigate: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SeeAllTopRatedScreen()),
            );
            widget.vm.topFoodFunc();
          },
        ),
        if (widget.vm.isLoadingTopFood)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: const Center(child: TopRatedShimmer()),
          ),

        if (!widget.vm.isLoadingTopFood && widget.vm.topFooderrorMessage)
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: ErrorView(
                icon: Icons.error_outline,
                message: 'Failed to load top rated food.',
                onRetry: () {
                  widget.vm.topFoodFunc();
                },
              ),
            ),
          ),
        SizedBox(
          height: widget.vm.topRatedFood.isNotEmpty ? 200 : 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.vm.topRatedFood.length,
            itemBuilder: (context, index) {
              final idValue = widget.vm.topRatedFood[index].id;
              final isFavorite = _favoriteIds.contains(idValue);
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TopRatedFoodCard(
                  width: 140,
                  height: 100,
                  image: widget.vm.topRatedFood[index].thumbnail,
                  foodType: widget.vm.topRatedFood[index].category,
                  title: widget.vm.topRatedFood[index].name,
                  reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                  rating: (idValue.hashCode % 5) + 1,
                  price: (5 + (idValue.hashCode % 20)),
                  distance: widget.vm.topRatedFood[index].area,
                  isFavorite: isFavorite,
                  onFavoriteToggle: (fav) => _toggleFavorite(idValue, fav),
                  handleAddToCart: () {
                    cartVM.addToCart(
                      ProductUiModel(
                        id: widget.vm.topRatedFood[index].id,
                        name: widget.vm.topRatedFood[index].name,
                        category: widget.vm.topRatedFood[index].category,
                        area: widget.vm.topRatedFood[index].area,
                        instructions: widget.vm.topRatedFood[index].instructions,
                        thumbnail: widget.vm.topRatedFood[index].thumbnail,
                        ingredients: widget.vm.topRatedFood[index].ingredients,
                        measures: widget.vm.topRatedFood[index].measures,
                        reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                        rating: (idValue.hashCode % 5) + 1,
                        price: (5 + (idValue.hashCode % 20)),
                        distance: widget.vm.topRatedFood[index].area,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
