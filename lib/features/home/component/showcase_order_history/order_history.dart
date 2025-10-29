import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/features/home/component/showcase_order_history/order_history_card.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData appStaticData = AppStaticData();
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: appStaticData.orderHistory.length,
        itemBuilder: (context, index) {
          return OrderHistoryCard(
            image: appStaticData.orderHistory[index]['image'],
            title: appStaticData.orderHistory[index]['title'],
            subTitle: appStaticData.orderHistory[index]['subTitle'],
            price: appStaticData.orderHistory[index]['price'],
          );
        },
      ),
    );
  }
}
