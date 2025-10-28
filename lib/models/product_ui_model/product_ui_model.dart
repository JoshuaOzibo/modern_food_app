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
  });
}
