
import 'package:flutter/material.dart';
import 'package:modern_food_app/models/product_ui_model.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductUiModel> cartList = [];

  // void initializeCartViewmodel(){
    
  // }

  void addToCart(ProductUiModel item){
    if (!cartList.any((element) => element.id == item.id)) {
      cartList.add(item);
      notifyListeners();
    }
  }
  void removeFromCart(ProductUiModel item){
    cartList.removeWhere((element) => element.id == item.id,);
    notifyListeners();
  }


  void incrementQuantity(ProductUiModel item){
    if (item.quantity != null) {
      item.quantity = item.quantity! + 1;
    } else {
      item.quantity = 1;
    }
    notifyListeners();
  }

  void decrementQuantity(ProductUiModel item){
    if (item.quantity != null && item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      notifyListeners();
    } else {
      removeFromCart(item);
    }
  }

  double get subtotal {
    double total = 0.0;
    for (var item in cartList) {
      final price = item.price ?? 0.0;
      final quantity = item.quantity ?? 1;
      total += price * quantity;
    }
    return total;
  }

  double get discount {
    return subtotal * 0.10;
  }

  double get tax {
    return (subtotal - discount) * 0.025;
  }

  double get total {
    return subtotal - discount + tax;
  }
}