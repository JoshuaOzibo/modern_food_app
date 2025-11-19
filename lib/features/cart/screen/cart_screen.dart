import 'package:flutter/material.dart';
import 'package:modern_food_app/core/component/empty_state.dart';
import 'package:modern_food_app/core/component/title_text_without_icon.dart';
import 'package:modern_food_app/features/cart/component/delivery_section.dart';
import 'package:modern_food_app/features/cart/component/dine_in.dart';
import 'package:modern_food_app/features/cart/component/take_away_section.dart';
import 'package:modern_food_app/features/cart/widget/cart_card.dart';
import 'package:modern_food_app/features/cart/widget/cart_option.dart';
import 'package:modern_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenScreenState();
}

class _CartScreenScreenState extends State<CartScreen> {
  final selectList = ['Delivery', 'Take away', 'Dine in'];
  String selectedOption = 'Delivery';

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CartViewmodel>();

    Future<void> _refreshData() async {
      await Future.delayed(Duration(seconds: 1));
      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(title: Text('Payout Details')),
      body: RefreshIndicator(
        onRefresh: () => _refreshData(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Column(
                children: [
                  CartOption(
                    selectList: selectList,
                    onOptionChanged: (option) {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    selectedOption: selectedOption,
                  ),
                  SizedBox(height: 10),
                  TitleTextWithoutIcon(
                    leftText: selectedOption == 'Delivery'
                        ? 'Delivery'
                        : selectedOption == 'Take away'
                        ? "Take away"
                        : "Dine in",
                    rightText: '',
                    hasBox: false,
                  ),
                  if (selectedOption == 'Delivery') DeliverySection(),

                  if (selectedOption == 'Take away') TakeAwaySection(),

                  if (selectedOption == 'Dine in') DineIn(),
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
                              child: EmptyState(
                                message: 'No Items in Cart currently',
                                color: Colors.black,
                              ),
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
                                        onTap:
                                            (CompletionHandler handler) async {
                                              await handler(true);
                                              vm.cartList.removeAt(index);
                                              setState(() {});
                                            },
                                        color: Colors.red,
                                      ),
                                    ],
                                    key: ObjectKey(vm.cartList[index]),
                                    child: CartCard(
                                      handleIncrementQuantity: () => vm.incrementQuantity(vm.cartList[index]),
                                      handleDecrementQuantity: () => vm.decrementQuantity(vm.cartList[index]),
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
                          children: [
                            Text(
                              'Total Item(03)',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '\$190.00',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount(10%)',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '-\$20.00',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tax(2.5%)',
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              '\$10.00',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total amount',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$100.00',
                              style: TextStyle(color: Colors.black),
                            ),
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
