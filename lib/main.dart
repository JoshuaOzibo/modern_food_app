import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modern_food_app/core/theme/theme.dart';
import 'package:modern_food_app/features/auth/presentation/viewmodel/auth_provider.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/features/service_locator.dart';
import 'package:modern_food_app/index.dart';
import 'package:modern_food_app/models/product_db_model/product_db_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initializeServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductDbModelAdapter());
  // await Hive.openBox<ProductDbModel>('productsBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return sl<HomeViewModel>();
          },
        ),
        ChangeNotifierProvider(create: (_) => CartViewmodel()),

        ChangeNotifierProvider(create: (_) => sl<AuthProvider>()),
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
      theme: AppTheme.darkThemeMode,
      home: const Index(),
    );
  }
}
