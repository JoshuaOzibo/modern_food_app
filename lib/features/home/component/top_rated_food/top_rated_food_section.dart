import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/error_view.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/see_all_top_rated_screen.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class TopRatedFoodSection extends StatelessWidget {
  const TopRatedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    print('from rating ${vm.topRatedFood}');
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Top Rated Food', rightText: 'View all', handleNavigate: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAllTopRatedScreen(),))),
        if (vm.isLoadingTopFood)
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: const Center(child: CircularProgressIndicator()),
          ),

        if (!vm.isLoadingTopFood && vm.topFooderrorMessage)
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: ErrorView(
                message: 'Error Fetching Top Rated Food',
                onRetry: () {
                  vm.topFoodFunc();
                },
              ),
            ),
          ),
        SizedBox(
          height: vm.topRatedFood.isNotEmpty ? 200 : 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vm.topRatedFood.length,
            itemBuilder: (context, index) {
              final idValue = vm.topRatedFood[index].id;
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TopRatedFoodCard(
                  width: 140,
                  height: 100,
                  image: vm.topRatedFood[index].thumbnail,
                  foodType: vm.topRatedFood[index].category,
                  title: vm.topRatedFood[index].name,
                  reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                  rating: (idValue.hashCode % 5) + 1,
                  price: (5 + (idValue.hashCode % 20)),
                  distance: vm.topRatedFood[index].area,
                  handleAddToCart: () => print(vm.topRatedFood[index].name),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
