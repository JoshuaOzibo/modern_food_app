import 'package:flutter/material.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';
import 'package:modern_food_app/features/home/domain/entities/select_by_category_entity.dart';
import 'package:modern_food_app/features/home/domain/usecase/filter_food_by_category_usecase.dart';
import 'package:modern_food_app/features/home/domain/usecase/get_top_rated_food_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetTopRatedFoodUsecase getTopRatedFoodUsecase;
  final FilterFoodByCategoryUsecase filterFoodByCategoryUsecase;

  HomeViewModel({
    required this.getTopRatedFoodUsecase,
    required this.filterFoodByCategoryUsecase,
  });

  List<Entity> topRatedFood = [];
  List<Entity> popularCategoty = [];
  List<Entity> allTopRatedFoodList = [];
  List<Entity> allPopularCategoryList = [];
  List<SelectByCategoryEntity> filterFoodByCategoryList = [];

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
    topFoodFunc();
    foodCategoryFunc();
  }

  void topFoodFunc() async {
    isLoadingTopFood = true;
    topFooderrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=c');
      print('top rated response $response');
      response.fold(
        (failure) {
          print('top rated failure ${failure.message}');
          isLoadingTopFood = false;
          topFooderrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          print('top rated data List ${data.length}');
          isLoadingTopFood = false;
          notifyListeners();
          topRatedFood = data.map((e) {
            return Entity(
              id: e.id,
              name: e.name,
              category: e.category,
              area: e.area,
              instructions: e.instructions,
              thumbnail: e.thumbnail,
              ingredients: e.ingredients,
              measures: e.measures,
              youtube: e.youtube,
              price: e.price,
              quantity: e.quantity,
              rating: e.rating,
              distance: e.distance,
              reviews: e.reviews,
            );
          }).toList();
          
        },
      );
    } catch (e) {
      print('top rated error $e');
      isLoadingTopFood = false;
      topFooderrorMessage = true;
      notifyListeners();
    }

  }

  void foodCategoryFunc() async {
    isLoadingFoodCategory = true;
    foodCategoryerrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=f');
      response.fold(
        (failure) {
          isLoadingFoodCategory = false;
          foodCategoryerrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingFoodCategory = false;
          notifyListeners();
          popularCategoty = data
              .map(
                (e) => Entity(
                  id: e.id,
                  name: e.name,
                  category: e.category,
                  area: e.area,
                  instructions: e.instructions,
                  thumbnail: e.thumbnail,
                  ingredients: e.ingredients,
                  measures: e.measures,
                  youtube: e.youtube,
                  price: e.price,
                  quantity: e.quantity,
                  rating: e.rating,
                  distance: e.distance,
                  reviews: e.reviews,
                ),
              )
              .toList();
        },
      );
    } catch (e) {
      isLoadingFoodCategory = false;
      foodCategoryerrorMessage = true;
      notifyListeners();
    }

  }

  void allTopRatedFood() async {
    isLoadingAllTopFood = true;
    allTopFooderrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=b');
      response.fold(
        (failure) {
          isLoadingAllTopFood = false;
          allTopFooderrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingAllTopFood = false;
          notifyListeners();
          allTopRatedFoodList = data
              .map(
                (e) => Entity(
                  id: e.id,
                  name: e.name,
                  category: e.category,
                  area: e.area,
                  instructions: e.instructions,
                  thumbnail: e.thumbnail,
                  ingredients: e.ingredients,
                  measures: e.measures,
                  youtube: e.youtube,
                  price: e.price,
                  quantity: e.quantity,
                  rating: e.rating,
                  distance: e.distance,
                  reviews: e.reviews,
                ),
              )
              .toList();
        },
      );
    } catch (e) {
      isLoadingAllTopFood = false;
      allTopFooderrorMessage = true;
      notifyListeners();
    }

  }

  void allPopularCategory() async {
    isLoadingAllFoodCategory = true;
    allFoodCategoryErrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call('search.php?f=b');
      response.fold(
        (failure) {
          isLoadingAllFoodCategory = false;
          allFoodCategoryErrorMessage = true;
          notifyListeners();
          throw Failure(message: failure.message);
        },
        (data) {
          isLoadingAllFoodCategory = false;
          notifyListeners();
          allPopularCategoryList = data
              .map(
                (e) => Entity(
                  id: e.id,
                  name: e.name,
                  category: e.category,
                  area: e.area,
                  instructions: e.instructions,
                  thumbnail: e.thumbnail,
                  ingredients: e.ingredients,
                  measures: e.measures,
                  youtube: e.youtube,
                  price: e.price,
                  quantity: e.quantity,
                  rating: e.rating,
                  distance: e.distance,
                  reviews: e.reviews,
                ),
              )
              .toList();
        },
      );
    } catch (e) {
      isLoadingAllFoodCategory = false;
      allFoodCategoryErrorMessage = true;
      notifyListeners();
    }

  }

  void filterFoodByCategory(params) async {
    isLoadingFilterByCategory = true;
    isFilterByCategoryErrorMessage = false;
    notifyListeners();
    try {
      final response = await getTopRatedFoodUsecase.call(
        'filter.php?c=$params',
      );
      response.fold(
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
          filterFoodByCategoryList = data
              .map(
                (e) => SelectByCategoryEntity(
                  idMeal: e.id, 
                strMealThumb: e.thumbnail, 
                strMeal: e.name)
              )
              .toList();
        },
      );
    } catch (e) {
      isLoadingFilterByCategory = false;
      isFilterByCategoryErrorMessage = true;
      notifyListeners();
    }
  }
}
