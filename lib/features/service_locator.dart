import 'package:get_it/get_it.dart';
import 'package:modern_food_app/core/usecase/usecase.dart';
import 'package:modern_food_app/features/auth/data/dataSources/auth_remote_data_sources.dart';
import 'package:modern_food_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:modern_food_app/features/auth/domain/repository/auth_repository.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signin.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signup.dart';
import 'package:modern_food_app/features/auth/presentation/viewmodel/auth_provider.dart';
import 'package:modern_food_app/features/home/data/remote_data_source/top_food_remote_data_source.dart';
import 'package:modern_food_app/features/home/data/repository_impl/fetch_product_repository_impl.dart';
import 'package:modern_food_app/features/home/domain/repository/fetch_product_repository.dart';
import 'package:modern_food_app/features/home/domain/usecase/filter_food_by_category_usecase.dart';
import 'package:modern_food_app/features/home/domain/usecase/get_top_rated_food_usecase.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/network/app_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final sl = GetIt.instance;

Future<void> initializeServiceLocator() async {
  sl.registerLazySingleton<AppClient>(() => AppClient());

  sl.registerLazySingleton<TopFoodRemoteDataSource>(
    () => TopFoodRemoteDataSourceImpl(sl<AppClient>()),
  );

  sl.registerLazySingleton<FetchProductRepository>(
    () => FetchProductRepositoryImpl(sl<TopFoodRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetTopRatedFoodUsecase>(
    () => GetTopRatedFoodUsecase(sl<FetchProductRepository>()),
  );

  sl.registerLazySingleton<FilterFoodByCategoryUsecase>(
    () => FilterFoodByCategoryUsecase(sl<FetchProductRepository>()),
  );

  sl.registerFactory(
    () => HomeViewModel(
      getTopRatedFoodUsecase: sl<GetTopRatedFoodUsecase>(),
      filterFoodByCategoryUsecase: sl<FilterFoodByCategoryUsecase>(),
    ),
  );

  // ==================
  //  auth registration
  //===================
  final supabaseClient = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  sl.registerLazySingleton<SupabaseClient>(() => supabaseClient.client);
  sl.registerLazySingleton<AuthRemoteDataSources>(
    () => AuthRemoteDataSourcesImpl(supabaseClient: sl<SupabaseClient>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSources>()),
  );
  sl.registerFactory<UserSignup>(() => UserSignup(sl<AuthRepository>()));
  sl.registerFactory<UserSignin>(() => UserSignin(sl<AuthRepository>()));
  sl.registerLazySingleton(
    () => AuthProvider(
      userSignup: sl<UserSignup>(),
      userSignin: sl<UserSignin>(),
    ),
  );
}
