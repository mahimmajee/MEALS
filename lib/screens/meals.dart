import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    this.title,
    required this.meals,
  }) : super(key: key);

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealdetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                selectMeal(context, meal);
              },
            ));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    return title == null
        ? content
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content,
          );
  }
}
