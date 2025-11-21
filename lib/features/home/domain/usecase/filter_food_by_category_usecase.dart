import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/home/domain/entities/select_by_category_entity.dart';
import 'package:modern_food_app/features/home/domain/repository/select_by_category_repository.dart';

class FilterFoodByCategoryUsecase
    implements Usecase<List<SelectByCategoryEntity>, String> {
  final SelectByCategoryRepository _selectByCategoryRepository;

  const FilterFoodByCategoryUsecase(this._selectByCategoryRepository);

  @override
  Future<Either<Failure, List<SelectByCategoryEntity>>> call(String params) async {
    return await _selectByCategoryRepository.fetchByCategory(url: params);
  }
}
