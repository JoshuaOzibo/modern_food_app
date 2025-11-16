
import 'package:flutter/material.dart';
import 'package:modern_food_app/models/product_ui_model.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductUiModel> cartList = [];

  // void initializeCartViewmodel(){
    
  // }

  void addToCart(ProductUiModel item){
    cartList.add(item);
    notifyListeners();
  }
  void removeFromCart(ProductUiModel item){
    cartList.removeWhere((element) => element.id == item.id,);
    notifyListeners();
  }
}