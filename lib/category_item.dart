import 'package:flutter/material.dart';
import 'package:mealsappp/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String tittle;
  final Color color;

  CategoryItem(this.id, this.tittle, this.color);
  @override
  selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return CategoryMeals(id, tittle);
    }));
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectCategory(context)),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          tittle,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
