import 'package:flutter/material.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';
import 'package:modern_food_app/features/home/domain/usecase/get_top_rated_food_usecase.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier {
  final GetTopRatedFoodUsecase getTopRatedFoodUsecase;

  HomeViewModel(this.getTopRatedFoodUsecase);

  List<ProductUiModel> topRatedFood = [];
  List<ProductUiModel> popularCategoty = [];
  List<ProductUiModel> allTopRatedFoodList = [];
  List<ProductUiModel> allPopularCategoryList = [];

  // loadings
  bool isLoadingTopFood = true;
  bool isLoadingFoodCategory = true;
  bool isLoadingAllTopFood = true;
  bool isLoadingAllFoodCategory = true;

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
      final response = await getTopRatedFoodUsecase.call('search.php?f=c');
      topRatedFood = response.fold(
        (failure) {
          isLoadingTopFood = false;
          topFooderrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingTopFood = false;
          notifyListeners();
          return data['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList();
        },
      );
    } catch (e) {
      isLoadingTopFood = false;
      topFooderrorMessage = true;
      notifyListeners();
    }

    print('Top Rated Food fetched successfully from VM $topRatedFood');
  }

  void foodCategoryFunc() async {
    isLoadingFoodCategory = true;
    foodCategoryerrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=f');
      topRatedFood = response.fold(
        (failure) {
          isLoadingFoodCategory = false;
          foodCategoryerrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingFoodCategory = false;
          notifyListeners();
          return data['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList();
        },
      );
    } catch (e) {
      isLoadingFoodCategory = false;
      foodCategoryerrorMessage = true;
      notifyListeners();
    }

    print(' Food Category fetched successfully from VM $topRatedFood');
  }

 void allTopRatedFood() async {
    isLoadingAllTopFood = true;
    allTopFooderrorMessage = false;
    notifyListeners();
   
   

    print('all Top Rated Food: $topRatedFood');
  }

}

 

  // void allPopularCategory() async {
  //   isLoadingAllFoodCategory = true;
  //   allFoodCategoryErrorMessage = false;
  //   notifyListeners();
  //   try {
  //     final productCategoryResponse = await productRepository
  //         .fetchAllPopularCategoty();
  //     allPopularCategoryList =
  //         productCategoryResponse?['meals']
  //             .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
  //             .toList() ??
  //         [];
  //     notifyListeners();
  //     if (productCategoryResponse != null &&
  //         productCategoryResponse['meals'] != null) {
  //       print('fetch all top rated food successfully from vm');
  //       isLoadingAllFoodCategory = false;
  //       notifyListeners();
  //     } else {
  //       isLoadingAllFoodCategory = false;
  //       allFoodCategoryErrorMessage = true;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     isLoadingAllFoodCategory = false;
  //     allFoodCategoryErrorMessage = true;
  //     notifyListeners();
  //   }

  //   print('Top Rated Food: $topRatedFood');
  // }
