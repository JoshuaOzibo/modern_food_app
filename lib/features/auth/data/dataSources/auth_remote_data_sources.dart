import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSources {
  Future<String> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
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
  Future<String> signInWithEmailAndPassword({
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
      print(e);
      if (e.message != null) {
        throw Exception(e.message);
      } else {
        throw Exception(
          'An unknown authentication error occurred while trying to signin',
        );
      }
    }
  }
}
