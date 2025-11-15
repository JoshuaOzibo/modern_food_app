import 'package:flutter/material.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/home/domain/usecase/filter_food_by_category_usecase.dart';
import 'package:modern_food_app/features/home/domain/usecase/get_top_rated_food_usecase.dart';
import 'package:modern_food_app/models/product_ui_model/product_ui_model.dart';

class HomeViewModel extends ChangeNotifier {
  final GetTopRatedFoodUsecase getTopRatedFoodUsecase;
  final FilterFoodByCategoryUsecase filterFoodByCategoryUsecase;

  HomeViewModel(this.getTopRatedFoodUsecase, this.filterFoodByCategoryUsecase);

  List<ProductUiModel> topRatedFood = [];
  List<ProductUiModel> popularCategoty = [];
  List<ProductUiModel> allTopRatedFoodList = [];
  List<ProductUiModel> allPopularCategoryList = [];
  List<ProductUiModel> filterFoodByCategoryList = [];

  // loadings
  bool isLoadingTopFood = true;
  bool isLoadingFoodCategory = true;
  bool isLoadingAllTopFood = true;
  bool isLoadingAllFoodCategory = true;
  bool isLoadingFilterByCategory = true;

  // error message
  bool topFooderrorMessage = false;
  bool foodCategoryerrorMessage = false;
  bool allTopFooderrorMessage = false;
  bool allFoodCategoryErrorMessage = false;
  bool isFilterByCategoryErrorMessage = false;

  initProvider() async {

    if(topRatedFood.isEmpty) {
    topFoodFunc();
    }
    if(popularCategoty.isEmpty) {
    foodCategoryFunc();
    }
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
      popularCategoty = response.fold(
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
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=b');
      allTopRatedFoodList = response.fold(
        (failure) {
          isLoadingAllTopFood = false;
          allTopFooderrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingAllTopFood = false;
          notifyListeners();
          return data['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList();
        },
      );
    } catch (e) {
      isLoadingAllTopFood = false;
      allTopFooderrorMessage = true;
      notifyListeners();
    }

    print(' All Top Rated Food fetched successfully from VM $topRatedFood');
  }

  void allPopularCategory() async {
    isLoadingAllFoodCategory = true;
    allFoodCategoryErrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=b');
      allPopularCategoryList = response.fold(
        (failure) {
          isLoadingAllFoodCategory = false;
          allFoodCategoryErrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingAllFoodCategory = false;
          notifyListeners();
          return data['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList();
        },
      );
    } catch (e) {
      isLoadingAllFoodCategory = false;
      allFoodCategoryErrorMessage = true;
      notifyListeners();
    }

    print(' All Top Rated Food fetched successfully from VM $topRatedFood');
  }

  void filterFoodByCategory(params) async {
    isLoadingFilterByCategory = true;
    isFilterByCategoryErrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('filter.php?c=$params');
      filterFoodByCategoryList = response.fold(
        (failure) {
          isLoadingFilterByCategory = false;
          isFilterByCategoryErrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingFilterByCategory = false;
          notifyListeners();
          print('filter data $data');
          return data['meals']
              .map<ProductUiModel>((item) => ProductUiModel.fromJson(item))
              .toList();
        },
      );
    } catch (e) {
      isLoadingFilterByCategory = false;
      isFilterByCategoryErrorMessage = true;
      notifyListeners();
    }

    print(' All Top Rated Food fetched successfully from VM $topRatedFood');
  }
}
