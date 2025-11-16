import 'package:fpdart/fpdart.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';

abstract interface class FetchProductRepository {
  Future<Either<Failure, List<Entity>>> fetchTopFood({required String url});
}

