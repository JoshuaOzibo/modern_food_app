import 'package:fpdart/fpdart.dart';
import 'package:modern_food_app/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}










































// import 'package:fpdart/fpdart.dart';
// import 'package:modern_food_app/core/error/failure.dart';

// abstract interface class Usecase<SuccessType, Params> {
//   Future<Either<Failure, SuccessType>> call(Params params);
// }