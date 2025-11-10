import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signup.dart';

// class UserSignupParams {
//   final String name;
//   final String email;
//   final String password;

//   UserSignupParams(this.name, this.email, this.password);
// }

class AuthProvider extends ChangeNotifier {
  final UserSignup userSignup;

  AuthProvider(this.userSignup);

  Future signUpFunc(UserSignupParams params) async {
    try {
      final response = await userSignup.call(params);
      print(response);
    } on Exception catch (e) {
      // print(e.message);
      // print(e.error);
      // print(e.type);
      print(e.toString());
      print(e.runtimeType);
    }
  }
}
