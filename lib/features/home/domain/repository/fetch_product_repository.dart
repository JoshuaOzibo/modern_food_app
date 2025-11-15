import 'package:fpdart/fpdart.dart';
import 'package:modern_food_app/core/error/failure.dart';

abstract interface class FetchProductRepository {
  Future<Either<Failure, Map<String, dynamic>>> fetchTopFood({required String url});
}

