import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class TopRatedFoodSection extends StatelessWidget {
  const TopRatedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    print('from rating ${vm.topRatedFood}');
    final AppStaticData appStaticData = AppStaticData();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Top Rated Food', rightText: 'View all'),
        if (vm.topRatedFood.isEmpty) Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vm.topRatedFood.length,
            itemBuilder: (context, index) {
              final idValue = vm.topRatedFood[index].id;
              ;
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TopRatedFoodCard(
                  image: vm.topRatedFood[index].thumbnail,
                  foodType: vm.topRatedFood[index].category,
                  title: vm.topRatedFood[index].name,
                  reviews: "${(int.tryParse(idValue).hashCode % 20)}",
                  rating: (idValue.hashCode % 5) + 1,
                  price: (5 + (idValue.hashCode % 20)),
                  distance: vm.topRatedFood[index].area,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
