import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/repository/fetch_product_repository.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier {
  final FetchProductRepository productRepository = FetchProductRepository();
  List<ProductUiModel> topRatedFood = [];
  List<ProductUiModel> popularCategoty = [];
  List<ProductUiModel> allTopRatedFoodList = [];
  List<ProductUiModel> allPopularCategoryList = [];

  // loadings
  bool isLoadingTopFood = false;
  bool isLoadingFoodCategory = false;
  bool isLoadingAllTopFood = false;
  bool isLoadingAllFoodCategory = false;

  // error message
  bool topFooderrorMessage = false;
  bool foodCategoryerrorMessage = false;
  bool allTopFooderrorMessage = false;
  bool allFoodCategoryErrorMessage = false;

  initProvider() async {
    topFoodFunc();
    foodCategoryFunc();
  }

  void topFoodFunc() async {
    isLoadingTopFood = true;
    topFooderrorMessage = false;
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
        isLoadingTopFood = false;
        notifyListeners();
      } else {
        isLoadingTopFood = false;
        topFooderrorMessage = true;
        notifyListeners();
      }
    } catch (e) {
      isLoadingTopFood = false;
      topFooderrorMessage = true;
      notifyListeners();
      print('Error fetching top rated food: $e');
    }
  }

  void foodCategoryFunc() async {
    isLoadingFoodCategory = true;
    foodCategoryerrorMessage = false;
    notifyListeners();
    try {
      final productCategoryResponse = await productRepository
          .fetchPopularCategory();

      popularCategoty =
          productCategoryResponse?['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList() ??
          [];
      notifyListeners();
      if (productCategoryResponse != null &&
          productCategoryResponse['meals'] != null) {
        print('fetch successfully from vm');
        isLoadingFoodCategory = false;
        notifyListeners();
      } else {
        isLoadingFoodCategory = false;
        foodCategoryerrorMessage = true;
        notifyListeners();
      }
    } catch (e) {
      isLoadingFoodCategory = false;
      foodCategoryerrorMessage = true;
      notifyListeners();
    }

    print('Top Rated Food: $topRatedFood');
  }

  void allTopRatedFood() async {
    // isLoadingAllTopFood = true;
    // allTopFooderrorMessage = false;
    // notifyListeners();
    // try {
    //   final productCategoryResponse = await productRepository
    //       .fetchAllTopRatedFood();
    //   allTopRatedFoodList =
    //       productCategoryResponse?['meals']
    //           .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
    //           .toList() ??
    //       [];
    //   notifyListeners();
    //   if (productCategoryResponse != null &&
    //       productCategoryResponse['meals'] != null) {
    //     print('fetch all top rated food successfully from vm');
    //     isLoadingAllTopFood = false;
    //     notifyListeners();
    //   } else {
    //     isLoadingAllTopFood = false;
    //     allTopFooderrorMessage = true;
    //     notifyListeners();
    //   }
    // } catch (e) {
    //   isLoadingAllTopFood = false;
    //   allTopFooderrorMessage = true;
    //   notifyListeners();
    // }

    // print('Top Rated Food: $topRatedFood');
  }

  void allPopularCategory() async {
    // isLoadingAllFoodCategory = true;
    // allFoodCategoryErrorMessage = false;
    // notifyListeners();
    // try {
    //   final productCategoryResponse = await productRepository
    //       .fetchAllPopularCategoty();
    //   allPopularCategoryList =
    //       productCategoryResponse?['meals']
    //           .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
    //           .toList() ??
    //       [];
    //   notifyListeners();
    //   if (productCategoryResponse != null &&
    //       productCategoryResponse['meals'] != null) {
    //     print('fetch all top rated food successfully from vm');
    //     isLoadingAllFoodCategory = false;
    //     notifyListeners();
    //   } else {
    //     isLoadingAllFoodCategory = false;
    //     allFoodCategoryErrorMessage = true;
    //     notifyListeners();
    //   }
    // } catch (e) {
    //   isLoadingAllFoodCategory = false;
    //   allFoodCategoryErrorMessage = true;
    //   notifyListeners();
    // }

    // print('Top Rated Food: $topRatedFood');
  }
}
