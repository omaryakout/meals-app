import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favouriteMealsProvider.dart';
import 'package:meals_app/providers/filters.dart';

class Filters extends ConsumerWidget {
  Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Filters',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text('Gluten Free Meals'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.all(10),
          ),
          const SizedBox(
            height: 5,
          ),
          SwitchListTile(
            value: activeFilters[Filter.luctoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.luctoseFree, isChecked);
            },
            title: Text('luctose Free Meals'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.all(10),
          ),
          const SizedBox(
            height: 5,
          ),
         SwitchListTile(
            value: activeFilters[Filter.vegterian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.vegterian, isChecked);
            },
            title: Text('vegeterian Free Meals'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.all(10),
          ),
          const SizedBox(
            height: 5,
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text('vegan Free Meals'),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
