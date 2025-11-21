import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/error/network_exception.dart';
import 'package:modern_food_app/core/error/server_exception_error.dart';
import 'package:modern_food_app/features/home/data/remote_data_source/top_food_remote_data_source.dart';
import 'package:modern_food_app/features/home/domain/repository/select_by_category_repository.dart';
import 'package:modern_food_app/models/selected_section_ui_model.dart';

class SelectByCategoryImpl implements SelectByCategoryRepository {
  final TopFoodRemoteDataSource _topFoodRemoteDataSource;
  SelectByCategoryImpl(this._topFoodRemoteDataSource);
  @override
  Future<Either<Failure, List<SelectedSectionUiModel>>> fetchByCategory({
    required String url,
  }) async {
    try {
      final response = await _topFoodRemoteDataSource.fetchTopFood(url: url);
      final mapResponse = response['meals'] as List<dynamic>;
      final entires = mapResponse
          .map(
            (json) =>
                SelectedSectionUiModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return Right(entires);
    } on ServerExceptionError catch (e) {
      return Left(
        ServerExceptionError(message: e.message, statusCode: e.statusCode),
      );
    } on NetworkException catch (e) {
      return Left(NetworkException(message: e.message));
    } on Failure catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
