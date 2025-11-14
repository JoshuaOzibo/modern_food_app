
import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';

class GetTopRatedFoodUsecase implements Usecase<Map<String, dynamic>, String> {
  final FetchProductRepository repository;
  GetTopRatedFoodUsecase(this.repository);
@override
  Future<Either<Failure, Map<String, dynamic>>> call(String params) async {
    return await repository.fetchTopRatedFood(url: params);
  }
}