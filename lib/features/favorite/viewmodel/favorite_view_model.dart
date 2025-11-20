import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/domain/entities/entity.dart';

class FavoriteViewModel extends ChangeNotifier {
  final List<Entity> favoriteList= [];

  void addToFavorite(Entity favorite, String itemIndex, bool isFavorite){
    print(isFavorite);

    if(isFavorite){
      if(!favoriteList.any((item) => item.id == itemIndex)){
        favoriteList.add(favorite);
      }
    } else {
      favoriteList.removeWhere((item) => item.id == itemIndex);
    }

    notifyListeners();
    print('favorite list $favoriteList');
  }

  void removeFromFavorite(String itemIndex){
    favoriteList.removeWhere((item) => item.id == itemIndex);
    notifyListeners();
  }
}