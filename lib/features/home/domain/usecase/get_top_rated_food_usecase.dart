import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';

class GetTopRatedFoodUsecase implements Usecase<List<Entity>, String> {
  final FetchProductRepository repository;
  GetTopRatedFoodUsecase(this.repository);
@override
  Future<Either<Failure, List<Entity>>> call(String params) {
    return repository.fetchTopFood(url: params);
  }
}