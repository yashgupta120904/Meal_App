import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/mealdetails.dart';
import 'package:meal_app/widgets/mealitems.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key,  this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Mealdetails(meal: meal,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh .... nothing here',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => mealitem(
                meal: meals[index],
                onSelectmeal: (meal) {
                  selectmeal(context, meal);
                },
              ));
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
