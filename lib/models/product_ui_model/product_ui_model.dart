class ProductUiModel {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;
  int? quantity;
  final double? rating;
  final double? price;
  final String? distance;
  final String? reviews;

  ProductUiModel({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    required this.ingredients,
    required this.measures,
    this.youtube,
    this.price,
    this.quantity = 1,
    this.rating,
    this.distance,
    this.reviews,
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
