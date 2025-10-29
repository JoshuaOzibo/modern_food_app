import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';

class TopRatedFoodSection extends StatelessWidget {
  const TopRatedFoodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData appStaticData = AppStaticData();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Top Rated Food', rightText: 'View all'),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appStaticData.topRatedFoodData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TopRatedFoodCard(
                  image: appStaticData.topRatedFoodData[index]['image'],
                  foodType: appStaticData.topRatedFoodData[index]['foodType'],
                  title: appStaticData.topRatedFoodData[index]['title'],
                  reviews: appStaticData.topRatedFoodData[index]['reviews'],
                  rating: appStaticData.topRatedFoodData[index]['rating'],
                  price: appStaticData.topRatedFoodData[index]['price'],
                  distance: appStaticData.topRatedFoodData[index]['distance'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
