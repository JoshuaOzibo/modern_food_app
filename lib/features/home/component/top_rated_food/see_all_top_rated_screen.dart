import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_card.dart';

class SeeAllTopRatedScreen extends StatelessWidget {
  const SeeAllTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData localData = AppStaticData();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios)), Text('Top Rated Food')],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          itemCount: localData.topRatedFoodData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // childAspectRatio: 1,
            // mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TopRatedFoodCard(
                width: double.infinity,
                height: 100,
                image: localData.topRatedFoodData[index]['image'],
                foodType: localData.topRatedFoodData[index]['foodType'],
                title: localData.topRatedFoodData[index]['title'],
                reviews: localData.topRatedFoodData[index]['reviews'],
                rating: localData.topRatedFoodData[index]['rating'],
                price: localData.topRatedFoodData[index]['price'],
                distance: localData.topRatedFoodData[index]['distance'],
                handleAddToCart: () => print('Hello'),
              ),
            );
          },
        ),
      ),
    );
  }
}
