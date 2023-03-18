import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String route = '/category';
  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final List<Meal> meals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: meals[index].title,
              id:meals[index].id,
              affordability: meals[index].affordability,
              complexity: meals[index].complexity,
              duration: meals[index].duration,
              imageUrl: meals[index].imageUrl,
            );
          },
          itemCount: meals.length,
        ),
      ),
    );
  }
}
