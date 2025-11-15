import 'package:flutter/material.dart';

class FlyToDestinationAnimation {
  static void start({
    required BuildContext context,
    required GlobalKey sourceKey,
    required Offset destinationPosition,
    required Widget widget,
    required VoidCallback onComplete,
    Duration duration = const Duration(milliseconds: 800),
  }) {
    final RenderBox? renderBox =
        sourceKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      onComplete();
      return;
    }

    final Offset startPosition = renderBox.localToGlobal(Offset.zero);
    final Size widgetSize = renderBox.size;

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => _FlyAnimationOverlay(
        startPosition: startPosition,
        endPosition: destinationPosition,
        widgetSize: widgetSize,
        widget: widget,
        duration: duration,
        onAnimationComplete: () {
          overlayEntry.remove();
          onComplete();
        },
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }
}

class _FlyAnimationOverlay extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;
  final Size widgetSize;
  final Widget widget;
  final Duration duration;
  final VoidCallback onAnimationComplete;

  const _FlyAnimationOverlay({
    required this.startPosition,
    required this.endPosition,
    required this.widgetSize,
    required this.widget,
    required this.duration,
    required this.onAnimationComplete,
  });

  @override
  State<_FlyAnimationOverlay> createState() => _FlyAnimationOverlayState();
}

class _FlyAnimationOverlayState extends State<_FlyAnimationOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.15).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 0.3,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.15, end: 0.1).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 0.7,
      ),
    ]).animate(_controller);

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.0),
        weight: 0.4,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 0.6,
      ),
    ]).animate(_controller);

    
    _positionAnimation = Tween<Offset>(
      begin: widget.startPosition,
      end: widget.endPosition,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _controller.forward().then((_) {
      widget.onAnimationComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: _positionAnimation.value.dx,
          top: _positionAnimation.value.dy,
          child: IgnorePointer(
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: widget.widgetSize.width,
                  height: widget.widgetSize.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: widget.widget,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

