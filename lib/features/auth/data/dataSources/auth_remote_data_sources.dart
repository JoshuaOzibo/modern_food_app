import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<String> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> signinWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourcesImpl implements AuthRepository {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourcesImpl({required this.supabaseClient});

  @override
  Future<String> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user != null) {
        return response.user!.id;
      } else {
        throw Exception('Sign-up failed');
      }
    } on AuthException catch (e) {
      if (e.message != null) {
        throw Exception(e.message);
      } else {
        throw Exception('An unknown authentication error occurred');
      }
    }
  }

  @override
  Future<String> signinWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return response.user!.id;
      } else {
        throw Exception('Sign-in failed');
      }
    } on AuthException catch (e) {
      if (e.message != null) {
        throw Exception(e.message);
      } else {
        throw Exception('An unknown authentication error occurred');
      }
    }
  }
}
