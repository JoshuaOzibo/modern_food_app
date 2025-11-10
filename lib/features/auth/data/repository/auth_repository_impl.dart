import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/features/auth/data/dataSources/auth_remote_data_sources.dart';
import 'package:modern_food_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources authRemoteDataSources;

  const AuthRepositoryImpl(this.authRemoteDataSources);

  @override
  Future<Either<Failure, String>> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await authRemoteDataSources.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      if (userId.isNotEmpty) {
        print('success');
        return right(userId);
      }
    } catch (e) {
      print(e);
      return left(Failure(message: e.toString()));
    }

    return left(Failure());
  }

  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authRemoteDataSources.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.isNotEmpty) {
        print('user signin successfully');
        return Either.right(response);
      } else {
        print('error signing in');
        return Either.left(Failure());
      }
    } catch (e) {
      print(e);
      return Either.left(Failure(message: e.toString()));
    }
  }
}
