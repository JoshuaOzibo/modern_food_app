import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text.dart';
import 'package:modern_food_app/features/home/component/showcase_order_history/order_history_card.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStaticData appStaticData = AppStaticData();
    return Column(
      spacing: 10,
      children: [
        TitleText(leftText: 'Order Again', rightText: 'View all'),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: appStaticData.orderHistory.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: OrderHistoryCard(
                  image: appStaticData.orderHistory[index]['image'],
                  title: appStaticData.orderHistory[index]['title'],
                  subTitle: appStaticData.orderHistory[index]['subTitle'],
                  price: appStaticData.orderHistory[index]['price'].toString(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
