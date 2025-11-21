import 'package:modern_food_app/features/home/domain/entities/select_by_category_entity.dart';

class SelectedSectionUiModel extends SelectByCategoryEntity {
  SelectedSectionUiModel({
    required super.idMeal,
    required super.strMeal,
    required super.strMealThumb,
  });

  factory SelectedSectionUiModel.fromJson(Map<String, dynamic> json) {
    return SelectedSectionUiModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strMealThumb: json['strMealThumb'],
    );
  }
}
