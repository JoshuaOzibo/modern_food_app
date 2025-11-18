import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';

class FavoriteViewModel extends ChangeNotifier {
  final List<Entity> favoriteList= [];

  void addToFavorite(Entity favorite, String itemIndex, bool isFavorite){
    print(isFavorite);

    if(isFavorite || !favoriteList.any((item) => item.id == itemIndex)){
      favoriteList.removeWhere((item) => item.id == itemIndex);
    }else if(!isFavorite && !favoriteList.any((item) => item.id == itemIndex)){
      favoriteList.add(favorite);
    }

    notifyListeners();
    print(favoriteList);

  }
}