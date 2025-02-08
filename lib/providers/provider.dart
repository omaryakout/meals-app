import 'package:riverpod/riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';

final provideMeal = Provider((ref) => dummyMeals);
