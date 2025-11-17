import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget route;

  CustomPageTransition({required this.route})
    : super(
        pageBuilder: (context, animation, secondaryAnimation) {
          return route;
        },
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            child: child,
            linearTransition: false,
          );
        },
      );
}
