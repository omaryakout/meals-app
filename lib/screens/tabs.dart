import 'categories.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/providers/provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/providers/favouriteMealsProvider.dart';
import 'package:meals_app/providers/filters.dart';
import 'package:meals_app/providers/filters.dart';

class Tabs extends ConsumerStatefulWidget {
  Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  int pageIndex = 0;
  final List<Meal> favoriteMeals = [];

  void setPageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
    print(index);
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // void toggleFavourite(Meal favouriteMeal) {
  //   if (favoriteMeals.contains(favouriteMeal)) {
  //     setState(() {
  //       favoriteMeals.remove(favouriteMeal);
  //       _showInfoMessage('meal removed');
  //       Navigator.of(context).pop();
  //     });
  //   } else {
  //     setState(() {
  //       favoriteMeals.add(favouriteMeal);
  //       _showInfoMessage('meal added');
  //     });
  //   }
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (context) => Filters(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    String activeBarTitle = 'Categerioes';

    Widget content = Categories(allMeals: filteredMeals);

    if (pageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
      content = Meals(
        meals: favouriteMeals,
      );
      activeBarTitle = 'Favourite Meals';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeBarTitle),
      ),
      drawer: MainDrawer(
        onTapDrawer: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setPageIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'set meal',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'favourites'),
          ]),
      body: content,
    );
  }
}
