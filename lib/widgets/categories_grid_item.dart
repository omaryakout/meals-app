import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({super.key, required this.category,required this.onSelectItem});
  final Category category;
  void Function(Category category) onSelectItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>  onSelectItem(category),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.3),
            category.color.withOpacity(0.99)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20, color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
