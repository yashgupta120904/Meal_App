import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoritemealNotifier extends StateNotifier<List<Meal>> {
  FavoritemealNotifier() : super([]);

  bool selectedmealstatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritemealProvider =
    StateNotifierProvider<FavoritemealNotifier, List<Meal>>((ref) {
  return FavoritemealNotifier();
});
