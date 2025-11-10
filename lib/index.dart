import 'package:flutter/material.dart';
import 'package:modern_food_app/features/cart/screen/cart_screen.dart';
import 'package:modern_food_app/features/favorite/screen/favorite_screen.dart';
import 'package:modern_food_app/features/home/screen/home_screen.dart';
import 'package:modern_food_app/features/profile/screen/profile_screen.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int currentIndex = 0;
  List<Widget> pages = [
   const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 20,
        selectedItemColor: Colors.deepOrangeAccent,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Save'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),
    );
  }
}
