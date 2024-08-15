import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/tabsscreen.dart';
import 'package:meal_app/Provider/favoritemeals.dart';

class Mealdetails extends ConsumerWidget {
  const Mealdetails({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritemeal = ref.watch(favoritemealProvider);
    final isFavorite =favoritemeal.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritemealProvider.notifier)
                  .selectedmealstatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(wasAdded
                        ? 'Meal added as a favorite! '
                        : 'Meal removed! ')),
              );
            },
            icon: AnimatedSwitcher(duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => RotationTransition(turns: animation,child: child,
            ),
            child: Icon(isFavorite ? Icons.star : Icons.star_border,
            key: ValueKey(isFavorite)),
          )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 14,
            ),

            Text(
              'INGREDIENTS',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color.fromARGB(255, 243, 243, 0),
                  fontWeight: FontWeight.bold),
            ),
            // Text(meal.ingredients.toString(),
            // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //   color: Theme.of(context).colorScheme.onBackground,)
            // )
            const SizedBox(
              height: 10,
            ),
            for (final ingedient in meal.ingredients)
              Text(
                ingedient,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'STEPS',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Color.fromARGB(255, 243, 243, 0),
                  fontWeight: FontWeight.bold),
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
