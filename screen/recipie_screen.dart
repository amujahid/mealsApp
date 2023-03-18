import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  static const String route = '/mealsScreen';
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Set title = ModalRoute.of(context)!.settings.arguments as Set;

    String id = title.last;
    Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: meal.steps.map((e) => Text(e)).toList(),
      ),
    );
  }
}
