import 'package:flutter/material.dart';
import 'package:modern_food_app/features/cart/screen/cart_screen.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:modern_food_app/features/favorite/screen/favorite_screen.dart';
import 'package:modern_food_app/features/favorite/viewmodel/favorite_view_model.dart';
import 'package:modern_food_app/features/home/presentation/screen/home_screen.dart';
import 'package:modern_food_app/features/profile/screen/profile_screen.dart';
import 'package:provider/provider.dart';

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
    final cartCount = context.watch<CartViewmodel>().cartList.length;
    final favoriteCount = context.watch<FavoriteViewModel>().favoriteList.length;
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
          BottomNavigationBarItem(icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart_outlined),
              if (cartCount > 0)
              Positioned(
                top: 0,
                right: -10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(cartCount.toString(), style: TextStyle(fontSize: 10, color: Colors.white),),
                ),
              ),
            ],
          ), label: 'Cart'),
          BottomNavigationBarItem(icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.favorite_outline),
              if (favoriteCount > 0)
              Positioned(
                top: 0,
                right: -10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(favoriteCount.toString(), style: TextStyle(fontSize: 10, color: Colors.white),),),
              ),
            ],
          ), label: 'Save'),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'Profile'),
        ],
      ),
    );
  }
}
