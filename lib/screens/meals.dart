import 'categories.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meal_details.dart';

class Meals extends StatelessWidget {
  Meals(
      {super.key,
      required this.meals,
     
       this.title});
  List<Meal> meals;
 
  String? title;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('oh there is no meals here'));

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
         
          meal: meals[index],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Meals',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      ),
      body: content,
    );
  }
}
