import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/repository/fetch_product_repository.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier {
  final FetchProductRepository productRepository = FetchProductRepository();
  List<ProductUiModel> topRatedFood = [];
  List<ProductUiModel> popularCategoty = [];
  bool isLoading = false;
  bool errorMessage = false;

  initProvider() async {
      isLoading = true;
      errorMessage = false;
      notifyListeners();
    try {
      final response = await productRepository.fetchTopRatedFood();
      topRatedFood =
          response?['meals']
              ?.map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList() ??
          [];
      notifyListeners();
      if (response != null && response['meals'] != null) {
        print('fetch successfully from vm');
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        errorMessage = true;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      errorMessage = true;
      notifyListeners();
      print('Error fetching top rated food: $e');
    }
    final productCategoryResponse = await productRepository
        .fetchPopularCategory();

    popularCategoty =
        productCategoryResponse?['meals']
            .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
            .toList() ??
        [];
    notifyListeners();

    print('Top Rated Food: $topRatedFood');
  }
}
