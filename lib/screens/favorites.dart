import 'package:flutter/material.dart';
import 'package:mealsappp/models/meal.dart';

import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteList;

  Favorites(this.favoriteList);

  @override
  Widget build(BuildContext context) {
    if (favoriteList.isEmpty) {
      return Center(
          child: Text(
        "You don't have any favorites yet, Start add some ..",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ));
    } else {
      return ListView.builder(
        itemCount: favoriteList.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteList[index].id,
            affordability: favoriteList[index].affordability,
            complexity: favoriteList[index].complexity,
            duration: favoriteList[index].duration,
            imageUrl: favoriteList[index].imageUrl,
            title: favoriteList[index].title,
          );
        },
      );
    }
  }
}
