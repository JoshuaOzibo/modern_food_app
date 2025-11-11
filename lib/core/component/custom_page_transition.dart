import 'package:flutter/material.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget route;

  CustomPageTransition({required this.route})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route;
        },
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final animationStartPosition =
              Tween<Offset>(begin: Offset(0.5, 0), end: Offset.zero).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
          final fadeTransition = Tween<double>(begin: 0.5, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.ease),
          );

          return SlideTransition(
            position: animationStartPosition,
            child: FadeTransition(opacity: fadeTransition, child: child),
          );
        },
      );
}
