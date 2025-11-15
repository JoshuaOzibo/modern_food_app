import 'package:flutter/material.dart';

class SelectedSectionWidget extends StatelessWidget {
  const SelectedSectionWidget({
    super.key,
    required this.selectedCategory,
    required this.handleCloseWidget,
  });
  final String selectedCategory;
  final VoidCallback handleCloseWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.bottomCenter,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.deepOrange,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCategory,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: handleCloseWidget,
                  child: Icon(Icons.cancel, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              padding: EdgeInsets.all(10),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text('Hello World'),
                    subtitle: Text('My name is josh'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
