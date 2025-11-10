import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/auth/domain/repository/auth_repository.dart';

class UserSignupParams {
  final String name;
  final String email;
  final String password;

  UserSignupParams(this.name, this.email, this.password);
}

class UserSignup implements Usecase<String, UserSignupParams> {
  final AuthRepository authRepository;
  const UserSignup(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignupParams params) async {
   return await authRepository.signupWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}
