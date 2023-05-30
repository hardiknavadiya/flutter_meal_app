import 'package:flutter/widgets.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/provider/favourite_provider.dart';
import 'package:flutter_application_3/widgets/meal_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouritesScreen extends ConsumerStatefulWidget {
  static const routeName = '/favourite';

  const FavouritesScreen({super.key});

  @override
  ConsumerState<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends ConsumerState<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    List<Meal> favouritesMeals = ref.watch(favouriteMealProvider);
    if (favouritesMeals.isEmpty) {
      return const Center(
        child: Text("no Favourites Meals Found!"),
      );
    } else {
      return ListView.builder(
        itemCount: favouritesMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favouritesMeals[index]);
        },
      );
    }
  }
}
