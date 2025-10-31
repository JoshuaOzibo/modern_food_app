import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/circular_button.dart';
import 'package:modern_food_app/features/home/component/restaurant/restaurant.dart';
import 'package:modern_food_app/features/home/component/select_food_type.dart';
import 'package:modern_food_app/features/home/component/showcase_order_history/order_history.dart';
import 'package:modern_food_app/features/home/component/top_rated_food/top_rated_food_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: Image.asset(
                    'assets/images/chilli-9202873_1280.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SafeArea(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadiusGeometry.circular(100),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                                'assets/images/squirrel-619968_1280.jpg',
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Joshua Firm'),
                                Text('Dubai-unlimited Firm'),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          spacing: 10,
                          children: [
                            CircularButton(
                              handleCircularButtonTap: () {
                                print('Hello');
                              },
                              height: 40,
                              width: 40,
                              color: Colors.white,
                              widget: Icon(Icons.notification_add),
                            ),
                            CircularButton(
                              handleCircularButtonTap: () {
                                print('Hello');
                              },
                              height: 40,
                              width: 40,
                              color: Colors.white,
                              widget: Icon(Icons.notification_add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 175,
                  left: 20,
                  right: 20,
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Dishes, restaurants',
                          hintStyle: TextStyle(color: Colors.black87),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.mic, color: Colors.black),
                              SizedBox(width: 8),
                              Icon(Icons.graphic_eq_rounded, color: Colors.black),
                              SizedBox(width: 8),
                            ],
                          ),
                    
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 600,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectFoodType(),
                      OrderHistory(),
                      SizedBox(height: 20),
                      TopRatedFoodSection(),
                      Restaurant(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
