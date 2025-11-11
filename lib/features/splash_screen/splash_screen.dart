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

  // big circle opacity animation
  // late Animation<double> _bigBoxFadeTransition;
  // late AnimationController _bigCircleController;

  // text opacity transiction
  // late Animation<double> _textFadeTransition;
  // late AnimationController _textFadeController;

  // big box scale transiction
  late Animation<double> _bigBoxScaleTransition;
  late AnimationController _bigCircleScaleController;

  @override
  void initState() {
    super.initState();

    // controllers
    _smallCircleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // _bigCircleController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1500),
    // );
    // _textFadeController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 500),
    // );

    _bigCircleScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // actions
    smallCircleTransition =
        Tween<Offset>(
          begin: const Offset(-5, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(parent: _smallCircleController, curve: Curves.ease),
        );

    // _bigBoxFadeTransition = Tween<double>(begin: 0, end: 1).animate(
    //   CurvedAnimation(parent: _bigCircleController, curve: Curves.ease),
    // );

    // _textFadeTransition = Tween<double>(
    //   begin: 0,
    //   end: 1,
    // ).animate(CurvedAnimation(parent: _textFadeController, curve: Curves.ease));

    _bigBoxScaleTransition = Tween<double>(begin: 1, end: 12).animate(
      CurvedAnimation(parent: _bigCircleScaleController, curve: Curves.ease),
    );
    
    // animation shoot;
    // _bigCircleController.forward();
    // _textFadeController.forward();
        _smallCircleController.forward();
    // _bigCircleController.addListener(() {
    //   if (_bigCircleController.isCompleted) {
    //   }
    // });

    _smallCircleController.addListener(() {
      if (_smallCircleController.isCompleted) {
        _bigCircleScaleController.forward();
        // _textFadeController.reverse();
      }
    });

    _bigCircleScaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          CustomPageTransition(route: const SigninPage()),
        );
      }
    });
  }
  

  @override
  void dispose() {
    _smallCircleController.dispose();
    // _bigCircleController.dispose();
    _bigCircleScaleController.dispose();
    // _textFadeController.dispose();
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
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 35,
                    bottom: 35,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    bottom: 10,
                    child: SlideTransition(
                      position: smallCircleTransition,
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
                ],
              ),

              const SizedBox(height: 25),

              RichText(
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

              const SizedBox(height: 15),

              Text(
                'Discover delicious meals delivered fresh to your door',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
