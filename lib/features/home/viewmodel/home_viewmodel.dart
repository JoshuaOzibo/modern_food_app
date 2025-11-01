

import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/repository/fetch_product_repository.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier{
  List<Map<String, dynamic>> topRatedFood = [];
    final FetchProductRepository productRepository = FetchProductRepository();

  initProvider() async {
    final response = await productRepository.fetchProduct();
    topRatedFood = List<Map<String, dynamic>>.from(response?['meals']);
    notifyListeners();

    print('Top Rated Food: $topRatedFood');
  }
}