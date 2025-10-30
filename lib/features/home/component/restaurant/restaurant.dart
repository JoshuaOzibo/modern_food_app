import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/restaurant/restaurant_card.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData appStaticData = AppStaticData();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Restaurant Near Me', rightText: 'View all'),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appStaticData.restaurantsNearMe.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: RestaurantCard(
                  image: appStaticData.restaurantsNearMe[index]['image'], 
                  location: appStaticData.restaurantsNearMe[index]['image'], 
                  name: appStaticData.restaurantsNearMe[index]['image'],
                  distance: appStaticData.restaurantsNearMe[index]['distance'],
                  ),
              );
            },
          ),
        ),
      ],
    );
  }
}