import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  static const String route = '/mealsScreen';
  const MealsScreen({super.key});

  //builds a list with steps
  Widget buildContainer(child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  // Builds a title for recipies
  Widget titleBuilder(title, context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Set title = ModalRoute.of(context)!.settings.arguments as Set;

    String id = title.last;
    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titleBuilder('Ingredients', context),
            buildContainer(
              ListView.builder(
                  itemBuilder: (context, index) => Card(
                        color: Theme.of(context).colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(meal.ingredients[index]),
                        ),
                      ),
                  itemCount: meal.ingredients.length),
            ),
            titleBuilder('Steps', context),
            buildContainer()
          ],
        ),
      ),
    );
  }
}
