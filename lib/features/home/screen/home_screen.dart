import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/circular_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            top: 170,
            left: 20,
            right: 20,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Dishes, restaurants',
                filled: true,
                fillColor: Colors.white,
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.mic_off_sharp, color: Colors.grey),
                    SizedBox(width: 4),
                    Icon(Icons.graphic_eq_rounded, color: Colors.grey),
                  ],
                ),
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
