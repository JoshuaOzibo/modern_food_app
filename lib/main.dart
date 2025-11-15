import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modern_food_app/core/theme/theme.dart';
import 'package:modern_food_app/features/auth/data/dataSources/auth_remote_data_sources.dart';
import 'package:modern_food_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signin.dart';
import 'package:modern_food_app/features/auth/domain/usecases/user_signup.dart';
import 'package:modern_food_app/features/auth/presentation/viewmodel/auth_provider.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:modern_food_app/features/home/data/remote_data_source/top_food_remote_data_source.dart';
import 'package:modern_food_app/features/home/data/repository_impl/fetch_product_repository_impl.dart';
import 'package:modern_food_app/features/home/domain/usecase/filter_food_by_category_usecase.dart';
import 'package:modern_food_app/features/home/domain/usecase/get_top_rated_food_usecase.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/index.dart';
import 'package:modern_food_app/models/product_db_model/product_db_model.dart';
import 'package:modern_food_app/network/app_client.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductDbModelAdapter());
  await dotenv.load(fileName: ".env");
  // await Hive.openBox<ProductDbModel>('productsBox');
  final supabaseClient = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  // print(
  //   'Supabase Initialized ${dotenv.env['SUPABASE_URL']} , ${dotenv.env['SUPABASE_ANON_KEY']}',
  // );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final apiClient = AppClient();
            final topFoodRemoteDataSource = TopFoodRemoteDataSourceImpl(
              apiClient,
            );
            final fetchProductRepository = FetchProductRepositoryImpl(
              topFoodRemoteDataSource,
            );
            final getTopRatedFoodUsecase = GetTopRatedFoodUsecase(
              fetchProductRepository,
            );
            final filterFoodByCategoryUsecase = FilterFoodByCategoryUsecase(
              fetchProductRepository,
            );

            return HomeViewModel(getTopRatedFoodUsecase, filterFoodByCategoryUsecase);
          },
        ),
        ChangeNotifierProvider(create: (_) => CartViewmodel()),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(
            UserSignup(
              AuthRepositoryImpl(
                AuthRemoteDataSourcesImpl(
                  supabaseClient: supabaseClient.client,
                ),
              ),
            ),
            UserSignin(
              AuthRepositoryImpl(
                AuthRemoteDataSourcesImpl(
                  supabaseClient: supabaseClient.client,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Food App',
      theme: AppTheme.darkThemeMode, //const SplashScreen(),,
      home: const Index(),
    );
  }
}
