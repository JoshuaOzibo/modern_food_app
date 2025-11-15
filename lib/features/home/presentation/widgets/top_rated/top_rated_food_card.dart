import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/custom_cache_network_image.dart';
import 'package:modern_food_app/core/extensions/text_extension.dart';

class TopRatedFoodCard extends StatefulWidget {
  const TopRatedFoodCard({
    super.key,
    required this.image,
    required this.foodType,
    required this.title,
    required this.reviews,
    required this.rating,
    required this.price,
    required this.distance,
    required this.handleAddToCart,
    required this.width,
    required this.height,
  });

  final String image;
  final String foodType;
  final String title;
  final double rating;
  final double price;
  final String reviews;
  final String distance;
  final VoidCallback handleAddToCart;
  final double height;
  final double width;

  @override
  State<TopRatedFoodCard> createState() => _TopRatedFoodCardState();
}

class _TopRatedFoodCardState extends State<TopRatedFoodCard> {
  final GlobalKey _imageKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _animateToCart() {
    // Get the image position
    final RenderBox? renderBox =
        _imageKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final Offset startPosition = renderBox.localToGlobal(Offset.zero);
    final Size imageSize = renderBox.size;

    // Calculate cart icon position (second item in bottom nav bar at index 1)
    // With 4 items, cart icon is approximately at 1/4 of screen width
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bottomNavHeight = kBottomNavigationBarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Cart icon is at index 1, so approximately at 1/4 of screen width (assuming 4 items)
    final Offset endPosition = Offset(
      screenWidth * 0.25, // Approximate position of cart icon (second of 4 items)
      screenHeight - bottomNavHeight / 2, // Middle of bottom nav bar
    );

    // Create overlay entry with animated widget
    _overlayEntry = OverlayEntry(
      builder: (context) => _AnimatedImageOverlay(
        startPosition: startPosition,
        endPosition: endPosition,
        imageSize: imageSize,
        imageUrl: widget.image,
        onAnimationComplete: () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          widget.handleAddToCart();
        },
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              key: _imageKey,
              borderRadius: BorderRadius.circular(10),
              child: CustomCacheNetworkImage(
                height: widget.height,
                image: widget.image,
                width: widget.width,
              ),
            ),

            Positioned(
              top: 5,
              left: 5,
              right: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(widget.foodType),
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextExtension(maxWords: 2).limitWords(widget.title),
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 2,
              children: [
                Icon(Icons.star, size: 15),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      widget.rating.toString(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('${widget.reviews} Reviews', style: TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Text(
                      '\$${widget.price.toString()}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.distance, style: TextStyle(fontSize: 11)),
                  ],
                ),

                MaterialButton(
                  minWidth: 30,
                  height: 10,
                  elevation: 0,
                  padding: EdgeInsets.all(2),
                  color: Colors.deepOrange,
                  onPressed: _animateToCart,
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _AnimatedImageOverlay extends StatefulWidget {
  final Offset startPosition;
  final Offset endPosition;
  final Size imageSize;
  final String imageUrl;
  final VoidCallback onAnimationComplete;

  const _AnimatedImageOverlay({
    required this.startPosition,
    required this.endPosition,
    required this.imageSize,
    required this.imageUrl,
    required this.onAnimationComplete,
  });

  @override
  State<_AnimatedImageOverlay> createState() => _AnimatedImageOverlayState();
}

class _AnimatedImageOverlayState extends State<_AnimatedImageOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Scale animation: scale up to 1.2, then scale down more as it moves to cart
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.15).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 0.3,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.2, end: 0.1).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 8,
      ),
    ]).animate(_controller);

    // Opacity animation: fade out as it moves (starts fading after initial scale)
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

    // Position animation: move from start to end with a curved path
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
                  width: widget.imageSize.width,
                  height: widget.imageSize.height,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CustomCacheNetworkImage(
                      height: widget.imageSize.height,
                      image: widget.imageUrl,
                      width: widget.imageSize.width,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
