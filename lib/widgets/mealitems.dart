import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class mealitem extends StatelessWidget {
  const mealitem({super.key, required this.meal,required this.onSelectmeal});
  final Meal meal;
  final void Function(Meal meal) onSelectmeal;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {onSelectmeal(meal);},
         
          child: Stack(
            children: [
              Hero(
                tag:  meal.id,
               
                child: Expanded(
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemtrait(
                                icon: Icons.schedule,
                                label: '${meal.duration.toString()} min'),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemtrait(
                                icon: Icons.work,
                                label: meal.complexity.name[0].toUpperCase() +
                                    meal.affordability.name.substring(1)),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemtrait(
                                icon: Icons.currency_rupee_sharp,
                                label:
                                    meal.affordability.name[0].toUpperCase() +
                                        meal.affordability.name.substring(1)),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
