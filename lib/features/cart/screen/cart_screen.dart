import 'package:flutter/material.dart';
import 'package:modern_food_app/core/base/app_static_data.dart';
import 'package:modern_food_app/core/component/title_text_without_icon.dart';
import 'package:modern_food_app/features/cart/component/cart_card.dart';
import 'package:modern_food_app/features/cart/component/cart_option.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenScreenState();
}

class _CartScreenScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CartViewmodel>();
    Future<void> _refreshData() async {
      await Future.delayed(Duration(seconds: 1));
      setState(() {});
    }

    final AppStaticData appStaticData = AppStaticData();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Payout Details'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              Column(
                children: [
                  CartOption(),
                  SizedBox(height: 10),
                  TitleTextWithoutIcon(
                    leftText: 'Address Details',
                    rightText: '',
                    hasBox: false,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Placeholder(
                          fallbackHeight: 50,
                          fallbackWidth: double.infinity,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Address to:'),
                                Text('Umm Hurair, Dubai, United Arab Emirates'),
                              ],
                            ),

                            MaterialButton(
                              onPressed: () {},
                              shape: Border.all(width: 1, color: Colors.orange),
                              child: Text(
                                'Change',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  TitleTextWithoutIcon(
                    leftText: 'Ordered Menu',
                    itemLength: '${vm.cartList.length}',
                    rightText: '',
                    hasBox: true,
                  ),

                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    width: double.infinity,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (vm.cartList.isEmpty)
                          SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('No Items in Cart currently'),
                            ),
                          ),
                        if (vm.cartList.isNotEmpty)
                          SizedBox(
                            height: 230,
                            child: ListView.builder(
                              itemCount: vm.cartList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: SwipeActionCell(
                                    trailingActions: <SwipeAction>[
                                       SwipeAction(
                                        title: "delete",
                                        onTap: (CompletionHandler handler) async {
                                          await handler(true);
                                          vm.cartList.removeAt(index);
                                          setState(() {});
                                        },
                                        color: Colors.red),
                                  ],
                                    key: ObjectKey(vm.cartList[index]),
                                    child: CartCard(
                                      image: vm.cartList[index].thumbnail,
                                      title: vm.cartList[index].name,
                                      subTitle: vm.cartList[index].category,
                                      price: vm.cartList[index].price
                                          .toString(),
                                      quantity: vm.cartList[index].quantity,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  TitleTextWithoutIcon(
                    leftText: 'Order Summary',
                    itemLength: '',
                    rightText: '',
                    hasBox: false,
                  ),
                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Total Item(03)'), Text('\$190.00')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Discount(10%)'), Text('\$-20.00')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Tax(2.5%)'), Text('\$10.00')],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total amount',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('\$100.00'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    color: Colors.deepOrange,
                    onPressed: () {},
                    child: Text('Proceed Payout'),
                  ),

                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
