import 'package:flutter/material.dart';
import 'package:modern_food_app/core/animations/fly_to_destination_animation.dart';
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
    this.isFavorite = false,
    this.onFavoriteToggle,
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
  final bool isFavorite;
  final ValueChanged<bool>? onFavoriteToggle;

  @override
  State<TopRatedFoodCard> createState() => _TopRatedFoodCardState();
}

class _TopRatedFoodCardState extends State<TopRatedFoodCard> {
  final GlobalKey _imageKey = GlobalKey();
  final GlobalKey _favoriteIconKey = GlobalKey();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(TopRatedFoodCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _isFavorite = widget.isFavorite;
    }
  }

  Offset _calculateCartIconPosition() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bottomNavHeight = kBottomNavigationBarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Cart icon is at index 1, so approximately at 1/4 of screen width (assuming 4 items)
    return Offset(
      screenWidth * 0.25,
      screenHeight - bottomNavHeight / 2,
    );
  }

  Offset _calculateFavoriteIconPosition() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bottomNavHeight = kBottomNavigationBarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Favorite icon is at index 2, so approximately at 50% of screen width (third of 4 items)
    return Offset(
      screenWidth * 0.5,
      screenHeight - bottomNavHeight / 2,
    );
  }

  void _animateToCart() {
    FlyToDestinationAnimation.start(
      context: context,
      sourceKey: _imageKey,
      destinationPosition: _calculateCartIconPosition(),
      widget: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CustomCacheNetworkImage(
          height: widget.height,
          image: widget.image,
          width: widget.width,
        ),
      ),
      onComplete: widget.handleAddToCart,
    );
  }

  void _animateToFavorite() {
    // If already favorite, just toggle without animation
    if (_isFavorite) {
      setState(() {
        _isFavorite = false;
      });
      widget.onFavoriteToggle?.call(false);
      return;
    }

    // Get the favorite icon position for animation
    final RenderBox? renderBox =
        _favoriteIconKey.currentContext?.findRenderObject() as RenderBox?;
    
    if (renderBox == null) {
      // If icon key is not available, use image key
      _animateFavoriteFromImage();
      return;
    }

    final Size iconSize = renderBox.size;

    FlyToDestinationAnimation.start(
      context: context,
      sourceKey: _favoriteIconKey,
      destinationPosition: _calculateFavoriteIconPosition(),
      widget: Container(
        width: iconSize.width,
        height: iconSize.height,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: iconSize.width * 0.6,
        ),
      ),
      onComplete: () {
        setState(() {
          _isFavorite = true;
        });
        widget.onFavoriteToggle?.call(true);
      },
    );
  }

  void _animateFavoriteFromImage() {
    FlyToDestinationAnimation.start(
      context: context,
      sourceKey: _imageKey,
      destinationPosition: _calculateFavoriteIconPosition(),
      widget: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 24,
        ),
      ),
      onComplete: () {
        setState(() {
          _isFavorite = true;
        });
        widget.onFavoriteToggle?.call(true);
      },
    );
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
                  GestureDetector(
                    key: _favoriteIconKey,
                    onTap: _animateToFavorite,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: _isFavorite ? Colors.red : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.white : Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
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
