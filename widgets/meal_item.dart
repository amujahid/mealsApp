import 'package:f2/models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  String title;
  String imageUrl;
  int duration;
  Complexity complexity;
  Affordability affordability;
  void selectMeal() {}
  MealItem(
      {required this.title,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
