import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/error/network_exception.dart';
import 'package:modern_food_app/core/error/server_exception_error.dart';
import 'package:modern_food_app/features/home/data/remote_data_source/top_food_remote_data_source.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';
import 'package:modern_food_app/models/product_ui_model.dart';

class FetchProductRepositoryImpl implements FetchProductRepository {
  final TopFoodRemoteDataSource _remoteDataSource;

  FetchProductRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Entity>>> fetchTopFood({required String url}) async {
    try{
      final data = await _remoteDataSource.fetchTopFood(url: url);
      final meals = data['meals'];
      final entities = meals.map((json) => ProductUiModel.fromJson(json)).toList();

      return Right(entities);
    } on ServerExceptionError catch(e){
      return left(ServerExceptionError(message: e.message));
    } on NetworkException catch(e){
     return left(NetworkException(message: e.message));
    } catch(e){
     return Left(Failure(message: e.toString()));
    }
  }
}


























































// import 'package:fpdart/src/either.dart';
// import 'package:modern_food_app/core/error/failure.dart';
// import 'package:modern_food_app/core/error/server_exception_error.dart';
// import 'package:modern_food_app/features/home/data/remote_data_source/top_food_remote_data_source.dart';
// import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';

// class FetchProductRepositoryImpl implements FetchProductRepository {
//   final TopFoodRemoteDataSource remoteDataSource;

//   FetchProductRepositoryImpl(this.remoteDataSource,);

//   @override
//   Future<Either<Failure, Map<String, dynamic>>> fetchTopRatedFood({
//     required String url,
//   }) async {
//     try {
//       final result = await remoteDataSource.fetchTopFood(url: url);
//       return Right(result);
//     } on ServerExceptionError catch (e) {
//       return Left(
//         ServerExceptionError(message: e.message, statusCode: e.statusCode),
//       );
//     } on NetworkError catch (e) {
//       return Left(NetworkError(message: e.message));
//     } catch (e) {
//       return Left(Failure(message: e.toString()));
//     }
//   }
// }
