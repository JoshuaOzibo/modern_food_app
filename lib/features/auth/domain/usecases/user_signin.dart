import 'package:fpdart/src/either.dart';
import 'package:modern_food_app/core/error/failure.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/auth/domain/repository/auth_repository.dart';

class SigninClass {
  final String email;
  final String password;

  SigninClass(this.email, this.password);
}

class UserSignin implements Usecase<String, SigninClass> {
  final AuthRepository authRepository;
  UserSignin(this.authRepository);

  @override
  Future<Either<Failure, String>> call(SigninClass params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}
