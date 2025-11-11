import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_food_app/features/auth/presentation/pages/signup_page.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/index.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // small circle controls
  late Animation<Offset> smallCircleTransition;
  late AnimationController _smallCircleController;

  // big circle opacity animation
  late Animation<double> _bigBoxFadeTransition;
  late AnimationController _bigCircleController;

  // text opacity transiction
  late Animation<double> _textFadeTransition;
  late AnimationController _textFadeController;

  // big box scale transiction
  late Animation<double> _bigBoxScaleTransition;
  late AnimationController _bigCircleScaleController;

  late Animation<double> _rotationTransition;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    // controllers
    _smallCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bigCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _textFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _bigCircleScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // actions
    smallCircleTransition =
        Tween<Offset>(
          begin: const Offset(-5, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(parent: _smallCircleController, curve: Curves.ease),
        );

    _bigBoxFadeTransition = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _bigCircleController, curve: Curves.ease),
    );

    _textFadeTransition = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textFadeController, curve: Curves.ease));

    _bigBoxScaleTransition = Tween<double>(begin: 1, end: 12).animate(
      CurvedAnimation(parent: _bigCircleScaleController, curve: Curves.ease),
    );

    _rotationTransition = Tween<double>(
      begin: 0,
      end: 0.7,
    ).animate(CurvedAnimation(parent: _rotationController, curve: Curves.ease));

    // animation shoot;
    _bigCircleController.forward();
    _textFadeController.forward();
    _bigCircleController.addListener(() {
      if (_bigCircleController.isCompleted) {
        _smallCircleController.forward();
      }
    });

    _smallCircleController.addListener(() {
      if (_smallCircleController.isCompleted) {
        _bigCircleScaleController.forward();
        _rotationController.forward();
        _textFadeController.reverse();
      }
    });

    _bigCircleScaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const SignupPage();
            },
            // transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final slideTransition = Tween<Offset>(begin: Offset(3, 0), end: Offset.zero)
                      .animate(
                        CurvedAnimation(parent: animation, curve: Curves.ease),
                      );
                  return SlideTransition(position: slideTransition, child: child);
                },
          ),
        );
     
      }
    });
  }

  @override
  void dispose() {
    _smallCircleController.dispose();
    _bigCircleController.dispose();
    _bigCircleScaleController.dispose();
    _textFadeController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  ScaleTransition(
                    scale: _bigBoxScaleTransition,
                    child: FadeTransition(
                      opacity: _bigBoxFadeTransition,
                      child: RotationTransition(
                        turns: _rotationTransition,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 35,
                    bottom: 35,
                    child: FadeTransition(
                      opacity: _bigBoxFadeTransition,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    child: SlideTransition(
                      position: smallCircleTransition,
                      child: FadeTransition(
                        opacity: _bigBoxFadeTransition,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              FadeTransition(
                opacity: _textFadeTransition,
                child: RichText(
                  text: TextSpan(
                    text: 'Foodie ',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    children: const [
                      TextSpan(
                        text: 'App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              FadeTransition(
                opacity: _textFadeTransition,
                child: Text(
                  'Discover delicious meals delivered fresh to your door',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
