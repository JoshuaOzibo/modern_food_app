import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/restaurant/restaurant_card.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final AppStaticData appStaticData = AppStaticData();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Popular Categories', rightText: 'View all'),
        if (vm.popularCategoty.isEmpty)
          Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 200,
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
