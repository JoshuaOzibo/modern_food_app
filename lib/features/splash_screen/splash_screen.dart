import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/custom_page_transition.dart';
import 'package:modern_food_app/features/auth/presentation/pages/signin_page.dart';

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
  bool scaleAnimation = false;
  bool _hasNavigated = false;

  // text opacity transiction
  late Animation<double> _textFadeTransition;
  late AnimationController _textFadeController;
  
  // Navigation timer
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    // controllers
    _textFadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _smallCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    // actions
    smallCircleTransition =
        Tween<Offset>(
          begin: const Offset(-5, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(parent: _smallCircleController, curve: Curves.ease),
        );

    _textFadeTransition = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _textFadeController, curve: Curves.ease),
    );

   _textFadeController.forward();

    _textFadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(milliseconds: 500), (){
          _smallCircleController.forward();
        });
      }
    });
    _smallCircleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          scaleAnimation = true;
        });
        _navigationTimer?.cancel();
        _navigationTimer = Timer(const Duration(milliseconds: 700), () {
          _navigateToSignIn();
        });
      }
    });
  }

  void _navigateToSignIn() {
    if (!_hasNavigated && mounted) {
      _hasNavigated = true;
      Navigator.push(
        context,
        CustomPageTransition(route: const SigninPage()),
      );
    }
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _textFadeController.dispose();
    _smallCircleController.dispose();
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
                  AnimatedScale(
                    scale: scaleAnimation ? 10 : 1,
                    duration: const Duration(milliseconds: 700),
                    child: FadeTransition(
                      opacity: _textFadeController,
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
                  Positioned(
                    right: 35,
                    bottom: 35,
                    child: FadeTransition(
                      opacity: _textFadeController,
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
                        opacity: _textFadeController,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 1000),
                child: FadeTransition(
                  opacity: _textFadeTransition,
                  child: RichText(
                    text: TextSpan(
                      text: 'Foodie ',
                      style: scaleAnimation
                          ? const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            )
                          : const TextStyle(
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
              ),

              const SizedBox(height: 15),

              AnimatedOpacity(
                opacity: _smallCircleController.isCompleted ? 0 : 1,
                duration: Duration(milliseconds: 1000),
                child: FadeTransition(
                  opacity: _textFadeTransition,
                  child: Text(
                    'Discover delicious meals delivered fresh to your door',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
