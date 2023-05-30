import 'package:flutter_application_3/models/meal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealNotifier() : super([]);
  void toggleFavourites(meal) {
    var isFavourite = state.contains(meal);
    if (isFavourite) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});
