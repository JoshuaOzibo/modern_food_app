import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';

class SelectFoodType extends StatelessWidget {
  const SelectFoodType({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData appStaticData = AppStaticData();

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appStaticData.selectItemList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              print(appStaticData.selectItemList[index]['title']);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 6,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        appStaticData.selectItemList[index]['image'],
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(appStaticData.selectItemList[index]['title']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
