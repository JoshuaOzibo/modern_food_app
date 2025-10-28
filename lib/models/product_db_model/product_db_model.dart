import 'package:hive/hive.dart';

part 'product_db_model.g.dart';

@HiveType(typeId: 0)
class ProductDbModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String category;

  @HiveField(3)
  String area;

  @HiveField(4)
  String instructions;

  @HiveField(5)
  String thumbnail;

  @HiveField(6)
  String? youtube;

  @HiveField(7)
  List<String> ingredients;

  @HiveField(8)
  List<String> measures;

  @HiveField(9)
  int? quantity;

  @HiveField(10)
  double? rating;

  @HiveField(11)
  double? price;

  ProductDbModel({
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
    this.quantity,
    this.rating,
  });
}
