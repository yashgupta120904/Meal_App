import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/Provider/filter_provider.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/Drawer.dart';
import 'package:meal_app/Provider/favoritemeals.dart';
import 'package:meal_app/Provider/mealsprovider.dart ';


class TabsScreen extends ConsumerStatefulWidget {
  //for stateless=ConsumerWidget
  const TabsScreen({
    super.key,
  });

  //final filteredmeals;
  @override
  ConsumerState<TabsScreen> createState() {
    return TabSreenState();
  }
}

class TabSreenState extends ConsumerState<TabsScreen> {
  int selectedPageindex = 0;

  // if (isExisting) {
  //   setState(() {
  //     favoritesmeal.remove(meal);
  //     showinfomessage("It is no longer faovrite!");
  //   });
  // } else {
  //   setState(() {
  //     favoritesmeal.add(meal);
  //     showinfomessage("Marked as favorite!");
  //   }
  //   );
  // }

  void selectedpage(index) {
    setState(() {
      selectedPageindex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    } else {
      // Navigator.of(context).pop();
    }

    // (Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (ctx) => MealScreen(
    //             meals: favoritesmeal, onfavroites: favoritemealstatus))));
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final activeFilter = ref.watch(filtersProvider);
    final availableMeal = meals.where((meal) {
      if (activeFilter[Filter.sugarfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = CategoriesScreen(
      // onfavroites: favoritemealstatus,
      availableMeal: availableMeal,
    );
    var activepageTitle = 'Categories';

    if (selectedPageindex == 1) {
      final Favoritemeal = ref.watch(favoritemealProvider);
      activepage = MealScreen(meals: Favoritemeal);
      activepageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: setScreen),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedpage,
        currentIndex: selectedPageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
