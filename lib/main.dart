import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:modern_food_app/index.dart';
import 'package:modern_food_app/models/product_db_model/product_db_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductDbModelAdapter());
  // await Hive.openBox<ProductDbModel>('productsBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Index());
  }
}
