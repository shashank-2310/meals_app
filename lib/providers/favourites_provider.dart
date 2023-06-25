import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);
  //StateNotifier doesn't allow to edit (add/remove) the value
  //or list in this case, passed in the super methods. but we can replace/re-assign the value.

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealIsfavourite = state.contains(meal);

    if (mealIsfavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      //assigns a new list to state & ...state ensures all previous
      //data is pulled & added to the new list individually & thereafter a new meal is added
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
