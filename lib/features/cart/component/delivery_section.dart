import 'package:flutter/material.dart';
import 'package:modern_food_app/features/cart/component/location_widget.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: LocationWidget(),
          ),
          SizedBox(height: 10),

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
                child: Text('View', style: TextStyle(color: Colors.orange)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
