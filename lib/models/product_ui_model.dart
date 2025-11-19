import 'package:modern_food_app/features/home/domain/entities/entity.dart';

class ProductUiModel extends Entity {

  ProductUiModel({
    required super.id,
    required super.name,
    required super.category,
    required super.area,
    required super.instructions,
    required super.thumbnail,
    required super.ingredients,
    required super.measures,
    super.youtube,
    super.price,
    super.quantity = 1,
    super.rating,
    super.distance,
    super.reviews,
  });

  factory ProductUiModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().isNotEmpty) {
        ingredients.add(ingredient.toString());
        measures.add(measure != null ? measure.toString() : '');
      }
    }

    return ProductUiModel(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      youtube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
      price: (json['price'] != null)
          ? double.tryParse(json['price'].toString())
          : null,
      rating: (json['rating'] != null)
          ? double.tryParse(json['rating'].toString())
          : null,
    );
  }
}
