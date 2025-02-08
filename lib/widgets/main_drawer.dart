import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onTapDrawer});
  void Function(String identifier) onTapDrawer;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.redAccent.withOpacity(0.95),
              Colors.redAccent.withOpacity(0.55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'COOKING MEALS',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.filter_alt_rounded,
            color: Colors.white,
            size: 25,
          ),
          title: Text(
            'FILTERS',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 25,
                  color: Colors.white,
                ),
          ),
          onTap: () {
            onTapDrawer('filters');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.set_meal_rounded,
            color: Colors.white,
            size: 25,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 28,
                  color: Colors.white,
                ),
          ),
          onTap: () {
            onTapDrawer('meals');
          },
        ),
      ]),
    );
  }
}
