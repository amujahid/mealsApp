import 'package:f2/models/meal.dart';
import 'package:flutter/material.dart';

import '../screen/recipie_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  void selectMeal(context) {
    Navigator.pushNamed(context, MealsScreen.route, arguments: {id});
  }

  const MealItem(
      {required this.title,
      required this.id,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: ColoredBox(
                    color: Colors.white,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                ),
                // add a text widget on top of the image
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              transformAlignment: Alignment.center,
              child: Row(children: [
                Container(
                    // margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                        onPressed: null, icon: Icon(Icons.window_outlined))),
                Spacer(),
                IconButton(onPressed: null, icon: Icon(Icons.window_outlined)),
                Spacer(),
                IconButton(onPressed: null, icon: Icon(Icons.window_outlined)),
                // what is spaceBetween?
              ]),
            )
          ],
        ),
      ),
    );
  }
}
