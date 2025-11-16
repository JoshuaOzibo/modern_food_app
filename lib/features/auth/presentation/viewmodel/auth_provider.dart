import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signin.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signup.dart';

class AuthProvider extends ChangeNotifier {
  final UserSignup userSignup;
  final UserSignin userSignin;

  AuthProvider({required this.userSignup, required this.userSignin});

  Future signUpFunc(UserSignupParams params) async {
    try {
      final response = await userSignup.call(params);
      print(response);
    } on Exception catch (e) {
      print(e.toString());
      print(e.runtimeType);
    }
  }

  Future signInFunc(SigninClass params) async{
    try{
      final res = await userSignin.call(params);
      print(res);
    }catch(e){
      print(e);
    }

  }
}
