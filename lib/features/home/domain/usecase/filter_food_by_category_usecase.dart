import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';

class FilterFoodByCategoryUsecase
    implements Usecase<Map<String, dynamic>, String> {
  final FetchProductRepository _fetchProductRepository;

  const FilterFoodByCategoryUsecase(this._fetchProductRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(String params) async {
    return await _fetchProductRepository.fetchTopFood(url: params);
  }
}
