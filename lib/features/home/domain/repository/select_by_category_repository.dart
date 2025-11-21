import 'package:fpdart/fpdart.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/home/domain/entities/select_by_category_entity.dart';

abstract interface class SelectByCategoryRepository {
  Future<Either<Failure, List<SelectByCategoryEntity>>> fetchByCategory({
    required String url,
  });
}
