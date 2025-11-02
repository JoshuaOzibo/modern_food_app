import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/repository/fetch_product_repository.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProductUiModel> topRatedFood = [];
  final FetchProductRepository productRepository = FetchProductRepository();

  initProvider() async {
    final response = await productRepository.fetchProduct();
    topRatedFood =
        response?['meals']
            ?.map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
            .toList() ??
        [];
    notifyListeners();

    print('Top Rated Food: $topRatedFood');
  }
}
