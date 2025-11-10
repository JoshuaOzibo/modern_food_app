import 'package:fpdart/fpdart.dart';
import 'package:modern_food_app/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
