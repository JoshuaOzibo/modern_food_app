import 'package:flutter/material.dart';
import 'package:modern_food_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:modern_food_app/features/home/presentation/widgets/select_by_category/select_by_category_card.dart';
import 'package:provider/provider.dart';

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
    final vm = context.watch<HomeViewModel>();
    return Container(
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
                childAspectRatio: 1,
              ),
              padding: EdgeInsets.all(10),
              itemCount: vm.filterFoodByCategoryList.length,
              itemBuilder: (context, index) {
                return SelectByCategoryCard(
                  image: vm.filterFoodByCategoryList[index].thumbnail,
                  height: 100,
                  width: double.infinity,
                  title: vm.filterFoodByCategoryList[index].name,
                  subtitle: vm.filterFoodByCategoryList[index].category,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
