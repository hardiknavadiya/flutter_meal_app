import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/meal.dart';
import 'meals_provider.dart';

class FilterProviderNotifier extends StateNotifier<Map<String, bool>> {
  FilterProviderNotifier()
      : super({
          "GlutenFree": false,
          "Vegan": false,
          "Vegetarian": false,
          "LactoseFree": false
        });
  void setFilter(String filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<String, bool>>((ref) {
  return FilterProviderNotifier();
});

final filterMealProvider = Provider((ref) {
  List<Meal> displayMeals = ref.watch(mealProvider);
  Map<String, bool> filterValue = ref.watch(filterProvider);
  return displayMeals.where((meal) {
    if (filterValue["GlutenFree"]! && !meal.isGlutenFree) {
      return false;
    }
    if (filterValue["Vegan"]! && !meal.isVegan) {
      return false;
    }
    if (filterValue["Vegetarian"]! && !meal.isVegetarian) {
      return false;
    }
    if (filterValue["LactoseFree"]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
