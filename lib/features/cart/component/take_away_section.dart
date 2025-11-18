import 'package:flutter/material.dart';

class TakeAwaySection extends StatelessWidget {
  const TakeAwaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Placeholder(fallbackHeight: 50, fallbackWidth: double.infinity),

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
                child: Text('Change', style: TextStyle(color: Colors.orange)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
