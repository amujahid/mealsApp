import 'package:flutter/material.dart';

import 'screen/screen.dart';
import 'screen/meals_screen.dart';
import 'screen/recipie_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Cascadia Code',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(fontSize: 20)),
      ),
      // home: CategoriesScreen(),
      routes: {
        Navigator.defaultRouteName: (context) => CategoriesScreen(),
        MealsScreen.route: (context) => const MealsScreen(),
        CategoryMealsScreen.route: (context) => const CategoryMealsScreen()
      },
    );
  }
}
