import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meal_item_trait.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  MealItem(
      {super.key,
      required this.meal,
      
      });
  Meal meal;
  
 

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1).toLowerCase();
  }

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1).toLowerCase();
  }

  void onSelectMeal(Meal meal, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetails(
            meal: meal,
            
           
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal, context);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.timelapse_sharp,
                            label: meal.duration.toString()),
                        const SizedBox(
                          width: 6,
                        ),
                        MealItemTrait(icon: Icons.badge, label: complexityText),
                        const SizedBox(
                          width: 6,
                        ),
                        MealItemTrait(
                            icon: Icons.badge, label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
