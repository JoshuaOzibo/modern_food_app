import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modern_food_app/features/home/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/index.dart';
import 'package:modern_food_app/models/product_db_model/product_db_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductDbModelAdapter());
  await dotenv.load(fileName: ".env");
  // await Hive.openBox<ProductDbModel>('productsBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeViewModel()),
    ], child: const Index()));
  }
}
