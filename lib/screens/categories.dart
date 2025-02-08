import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/categories_grid_item.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meal_details.dart';

class Categories extends StatefulWidget {
  Categories({super.key, required this.allMeals});

  List<Meal> allMeals;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onSelectItem(Category category) {
      final List<Meal> selectedMeals = widget.allMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Meals(
            meals: selectedMeals,
            title: 'Meals',
          ),
        ),
      );
    }

    return AnimatedBuilder(
        animation: _animationController,
        builder: ((context, child) => Padding(
            padding: EdgeInsets.only(top:100 - _animationController.value * 100),
            child: child,
            )),
        child: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectItem: (Category) {
                    onSelectItem(category);
                  }),
          ],
        ));
  }
}
