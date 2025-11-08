import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: EdgeInsetsGeometry.only(top: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.asset(
                'assets/images/chilli-9202873_1280.jpg',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 2,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Icon(Icons.edit),
                    ),
                    GestureDetector(
                      onTap: () {
                        BottomSheet(
                          backgroundColor: Colors.brown,
                          onClosing: (){}, builder: (context){
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('Hello from bottom shit'),
                            ),
                          );
                        });
                      },
                      child: Text('Edit')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
