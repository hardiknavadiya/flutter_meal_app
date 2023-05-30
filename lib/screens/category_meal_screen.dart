import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/meal_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/filter_provider.dart';

class CategoryMealScreen extends ConsumerWidget {
  static const routeName = '/category-meals';
  const CategoryMealScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryName = routeArgs['name'];
    final categoryId = routeArgs['id'];
    var displayMeals = ref.watch(filterMealProvider);
    print(displayMeals.length);
    var displayFilteredMeal = displayMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            categoryName!,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
        body: ListView.builder(
          itemCount: displayFilteredMeal.length,
          itemBuilder: (context, index) {
            return MealItem(displayFilteredMeal[index]);
          },
        ));
  }
}
